import Combine

protocol RepositoryClientProtocol {

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<SearchResponse, Error>

    func queryRepositories(with url: String) -> AnyPublisher<[RepositoryResponse], Error>

    func queryRepository(with path: String) -> AnyPublisher<RepositoryResponse, Error>

}
