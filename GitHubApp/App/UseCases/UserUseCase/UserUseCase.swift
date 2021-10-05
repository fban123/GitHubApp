import Combine

class UserUseCase: UserUseCaseProtocol {

    private let userDataSource: UserDataSourceProtocol
    private let repositoryDataSource: RepositoryDataSourceProtocol

    init(
        userDataSource: UserDataSourceProtocol,
        repositoryDataSource: RepositoryDataSourceProtocol
    ) {
        self.userDataSource = userDataSource
        self.repositoryDataSource = repositoryDataSource
    }

    func queryItem(with identifier:String) -> AnyPublisher<UserModel, Error> {
        let userStream = userDataSource
            .queryUser(with: identifier)
            .share()

        return userStream
            .flatMap { [weak self] userItem -> AnyPublisher<[RepositoryDataSourceModel], Error> in
                guard let self = self else { return .empty() }

                return self.repositoryDataSource
                    .queryRepositories(with: userItem.reposUrl)
            }
            .combineLatest(userStream)
            .map { UserModel(from: $0.1, repoModel: $0.0) }
            .eraseToAnyPublisher()
    }
    
}
