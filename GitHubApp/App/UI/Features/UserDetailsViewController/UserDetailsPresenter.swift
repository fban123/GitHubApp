import Combine

class UserDetailsPresenter {

    private let identifier: String
    private let useCase: UserUseCaseProtocol
    private let router: UserDetailsRouterProtocol

    var item: AnyPublisher<UserDetailsViewModel, Error> {
        useCase
            .queryItem(with: identifier)
            .map { UserDetailsViewModel(from: $0) }
            .receiveOnMain()
    }

    init(
        identifier: String,
        useCase: UserUseCaseProtocol,
        router: UserDetailsRouterProtocol
    ) {
        self.identifier = identifier
        self.useCase = useCase
        self.router = router
    }

    func onUsernameTapped(with userUrl: String) {
        router.goToWebViewFromUserDetails(with: userUrl)
    }

    func onCellTapped(with repoUrl: String) {
        router.goToWebViewFromUserDetails(with: repoUrl)
    }

}
