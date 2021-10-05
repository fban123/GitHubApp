import Combine

protocol ApiClientProtocol {

    func executeAndReturn<ParamsType: Encodable, ResultType: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: ParamsType?
    ) -> AnyPublisher<ResultType, Error>

}
