import Combine

class UserClient: UserClientProtocol {

    private let baseClient: BaseApiClientProtocol

    init(baseClient: BaseApiClientProtocol) {
        self.baseClient = baseClient
    }

    func queryUser(with name: String) -> AnyPublisher<UserResponse, Error> {
        baseClient
            .get(path: "/users/\(name)")
    }

}
