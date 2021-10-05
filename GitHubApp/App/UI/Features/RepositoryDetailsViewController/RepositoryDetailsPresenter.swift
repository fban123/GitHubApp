import Combine

class RepositoryDetailsPresenter {

    private let identifier: String
    private let useCase: RepositoryUseCaseProtocol
    private let router: RepositoryDetailsRouterProtocol

    var item: AnyPublisher<RepositoryDetailsViewModel, Error> {
        useCase
            .queryRepository(with: identifier)
            .map { RepositoryDetailsViewModel(from: $0) }
            .receiveOnMain()
    }

    init(
        identifier: String,
        useCase: RepositoryUseCaseProtocol,
        router: RepositoryDetailsRouterProtocol
    ) {
        self.identifier = identifier
        self.useCase = useCase
        self.router = router
    }

    func onLinkTapped(with externalLink: String) {
        router.goToWebView(with: externalLink)
    }

}
