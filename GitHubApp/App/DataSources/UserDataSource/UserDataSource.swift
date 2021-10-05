import Combine

class UserDataSource: UserDataSourceProtocol {

    private let client: UserClientProtocol

    init(client: UserClientProtocol) {
        self.client = client
    }

    func queryUser(with name: String) -> AnyPublisher<UserDataSourceModel, Error> {
        client
            .queryUser(with: name)
            .map { UserDataSourceModel(from: $0) }
            .subscribeOnBackground()
    }

}
