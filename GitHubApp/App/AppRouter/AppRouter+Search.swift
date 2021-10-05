import UIKit

extension AppRouter: SearchRouterProtocol {

    func goToRepoDetails(with fullName: String) {
        guard Environment.current != .test else { return }

        let vc: RepositoryDetailsViewController = container.resolve(args: fullName)
        pushViewController(vc)
    }

    func goToOwnerDetails(with name: String) {
        guard Environment.current != .test else { return }

        let vc: UserDetailsViewController = container.resolve(args: name)
        pushViewController(vc)
    }

}
