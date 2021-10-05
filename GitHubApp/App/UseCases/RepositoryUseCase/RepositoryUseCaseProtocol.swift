import Combine

protocol RepositoryUseCaseProtocol {

    func queryRepository(with path: String) -> AnyPublisher<RepositoryModel, Error>

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<[RepositoryModel], Error>

}
