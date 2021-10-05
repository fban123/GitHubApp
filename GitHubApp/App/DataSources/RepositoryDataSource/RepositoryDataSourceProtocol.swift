import Combine

protocol RepositoryDataSourceProtocol {

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<[RepositoryDataSourceModel], Error>

    func queryRepositories(with url: String) -> AnyPublisher<[RepositoryDataSourceModel], Error>

    func queryRepository(with path: String) -> AnyPublisher<RepositoryDataSourceModel, Error>

}
