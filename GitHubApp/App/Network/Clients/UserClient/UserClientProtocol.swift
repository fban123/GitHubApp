import Combine

protocol UserClientProtocol {

    func queryUser(with name: String) -> AnyPublisher<UserResponse, Error>

}
