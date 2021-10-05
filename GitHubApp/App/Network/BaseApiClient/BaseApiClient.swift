import Foundation
import Combine

class BaseApiClient: BaseApiClientProtocol {

    private let baseUrl: String
    private let apiClient: ApiClientProtocol

    init(baseUrl: String, apiClient: ApiClientProtocol) {
        self.baseUrl = baseUrl
        self.apiClient = apiClient
    }

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]? = nil
    ) -> AnyPublisher<ResultType, Error> {
        apiClient.executeAndReturn(url: url(with: path), method: .get, parameters: queryParameters)
    }

    func get<ResultType: Decodable>(
        url: String,
        queryParameters: [String: String]? = nil
    ) -> AnyPublisher<ResultType, Error> {
        apiClient.executeAndReturn(url: url, method: .get, parameters: queryParameters)
    }

    func url(with path: String) -> String {
        "\(baseUrl)\(path)"
    }

}
