import Foundation
import Combine

protocol BaseApiClientProtocol {

    func get<ResultType: Decodable>(path: String, queryParameters: [String: String]?) -> AnyPublisher<ResultType, Error>

    func get<ResultType: Decodable>(url: String, queryParameters: [String: String]?) -> AnyPublisher<ResultType, Error>

}

extension BaseApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]? = nil
    ) -> AnyPublisher<ResultType, Error> {
        get(path: path, queryParameters: queryParameters)
    }

    func get<ResultType: Decodable>(
        url: String,
        queryParameters: [String: String]? = nil
    ) -> AnyPublisher<ResultType, Error> {
        get(url: url, queryParameters: queryParameters)
    }

}
