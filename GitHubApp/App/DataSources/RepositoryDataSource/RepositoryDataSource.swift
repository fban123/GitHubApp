import Combine

class RepositoryDataSource: RepositoryDataSourceProtocol {

    private let client: RepositoryClientProtocol

    init(client: RepositoryClientProtocol) {
        self.client = client
    }

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<[RepositoryDataSourceModel], Error> {
        client
            .queryRepositories(with: query, sortType: sortType)
            .map { $0.repositories.map { RepositoryDataSourceModel(from: $0) } }
            .subscribeOnBackground()
    }

    func queryRepositories(with url: String) -> AnyPublisher<[RepositoryDataSourceModel], Error> {
        client
            .queryRepositories(with: url)
            .map { $0.map { RepositoryDataSourceModel(from: $0) } }
            .subscribeOnBackground()
    }

    func queryRepository(with path: String) -> AnyPublisher<RepositoryDataSourceModel, Error> {
        client
            .queryRepository(with: path)
            .map { RepositoryDataSourceModel(from: $0) }
            .subscribeOnBackground()
    }
}
