import Combine

class SearchPresenter {

    private let useCase: RepositoryUseCaseProtocol
    private let sortCache: SortCacheProtocol
    private let router: SearchRouterProtocol

    var sortType: AnyPublisher<SortTypeViewModel, Never> {
        sortCache
            .type
    }

    init(
        useCase: RepositoryUseCaseProtocol,
        sortCache: SortCacheProtocol,
        router: SearchRouterProtocol
    ) {
        self.useCase = useCase
        self.sortCache = sortCache
        self.router = router
    }

    func updateSortCache(with type: SortTypeViewModel) {
        sortCache
            .updateType(with: type)
    }

    func queryRepositories(with query: String, sortType: SortTypeViewModel) -> AnyPublisher<[RepositoryViewModel], Never> {
        useCase
            .queryRepositories(with: query, sortType: sortType)
            .map { $0.map { RepositoryViewModel(from: $0) } }
            .replaceError(with: [])
            .receiveOnMain()
    }

    func onOwnerTapped(with name: String) {
        router.goToOwnerDetails(with: name)
    }

    func onRepoTapped(with fullName: String) {
        router.goToRepoDetails(with: fullName)
    }

}
