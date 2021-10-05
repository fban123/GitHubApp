import Combine

protocol UserUseCaseProtocol {

    func queryItem(with identifier:String) -> AnyPublisher<UserModel, Error>

}
