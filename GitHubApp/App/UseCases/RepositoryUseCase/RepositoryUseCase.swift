import Combine

class RepositoryUseCase: RepositoryUseCaseProtocol {

    private let dataSource: RepositoryDataSourceProtocol

    init(dataSource: RepositoryDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func queryRepository(with path: String) -> AnyPublisher<RepositoryModel, Error> {
        dataSource
            .queryRepository(with: path)
            .map { RepositoryModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<[RepositoryModel], Error> {
        dataSource
            .queryRepositories(with: query, sortType: sortType)
            .map { $0.map { RepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}
