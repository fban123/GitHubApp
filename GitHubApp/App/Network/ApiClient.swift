import Foundation
import Combine

public class ApiClient: ApiClientProtocol {

    private let urlSession: URLSession

    public init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func buildUrl<ParamsType: Encodable>(url: String, method: HTTPMethod, parameters: ParamsType?) -> URL? {
        guard var components = URLComponents(string: url) else { return nil }

        var queryItems = components.queryItems ?? []

        let params: [String: String]
        if let parameters = parameters as? [String: String] {
            params = parameters
        } else {
            params = [:]
        }
        queryItems.append(contentsOf: params.map(URLQueryItem.init))
        components.queryItems = queryItems

        return components.url
    }

    func execute<ParamsType: Encodable>(
        url: String,
        method: HTTPMethod,
        parameters: ParamsType? = nil
    ) -> AnyPublisher<Never, Error> {
        guard
            let request = buildRequest(url: url, method: method, parameters: parameters)
        else {
            return .error(error: ApiError.invalidUrl)
        }

        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap { [weak self] result in
                guard
                    let self = self,
                    let response = result.response as? HTTPURLResponse,
                    let statusCode = HttpStatusCode(rawValue: response.statusCode)
                else {
                    throw ApiError.invalidUrl
                }

                if let error = self.mapToApiError(status: statusCode) {
                    throw error
                }
            }
            .ignoreOutput()
            .eraseToAnyPublisher()
    }

    func executeAndReturn<ParamsType: Encodable, ResultType: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: ParamsType? = nil
    ) -> AnyPublisher<ResultType, Error> {
        guard
            let request = buildRequest(url: url, method: method, parameters: parameters)
        else {
            return .error(error: ApiError.invalidUrl)
        }

        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap { [weak self] result -> ResultType in
                guard
                    let self = self,
                    let response = result.response as? HTTPURLResponse,
                    let statusCode = HttpStatusCode(rawValue: response.statusCode)
                else {
                    throw ApiError.general
                }

                if let error = self.mapToApiError(status: statusCode) {
                    throw error
                }

                if
                    ResultType.self is Data.Type,
                    let data = result.data as? ResultType
                {
                    return data
                }

                guard let value: ResultType = self.parse(data: result.data) else {
                    throw ApiError.noData
                }

                return value
            }
            .first()
            .eraseToAnyPublisher()
    }

    private func buildRequest<ParamsType: Encodable>(
        url: String,
        method: HTTPMethod,
        parameters: ParamsType? = nil
    ) -> URLRequest? {
        guard let url = buildUrl(url: url, method: method, parameters: parameters) else { return nil }

        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = 3 * 60
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }

    private func parse<ResultType: Decodable>(data: Data?) -> ResultType? {
        guard let data = data else {
            return nil
        }

        do {
            return try JSONDecoder().decode(ResultType.self, from: data)
        } catch {
            return nil
        }
    }

    private func mapToApiError(status: HttpStatusCode) -> ApiError? {
        switch status {
        case .ok, .created, .accepted, .noContent:
            return nil
        case .badRequest, .notAcceptable, .unsupportedMediaType:
            return .badRequest
        case .unauthorized, .forbidden:
            return .unauthorized
        case .notFound:
            return .notFound
        case .methodNotAllowed, .requestTimeout:
            return .general
        case .internalServerError, .notImplemented, .badGateway, .serviceUnavailable, .gatewayTimeout:
            return .serverError
        }
    }

}
