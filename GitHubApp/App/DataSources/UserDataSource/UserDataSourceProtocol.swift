import Combine

protocol UserDataSourceProtocol {

    func queryUser(with name: String) -> AnyPublisher<UserDataSourceModel, Error>

}
