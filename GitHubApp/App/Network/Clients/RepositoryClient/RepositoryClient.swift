import Combine

class RepositoryClient: RepositoryClientProtocol {

    private let baseClient: BaseApiClientProtocol

    init(baseClient: BaseApiClientProtocol) {
        self.baseClient = baseClient
    }

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<SearchResponse, Error> {
        let sortQuery = sortType == .match ? "" : sortType.rawValue
        return baseClient
            .get(path: "/search/repositories",
                 queryParameters: [
                    "q" : "\(query)",
                    "sort" : "\(sortQuery)"])
    }

    func queryRepository(with path: String) -> AnyPublisher<RepositoryResponse, Error> {
        baseClient
            .get(path: "/repos/\(path)")
    }

    func queryRepositories(with url: String) -> AnyPublisher<[RepositoryResponse], Error> {
        baseClient
            .get(url: url)
    }

}
