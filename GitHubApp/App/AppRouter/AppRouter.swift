import UIKit
import Resolver

class AppRouter {

    let container: Resolver

    private weak var navigationController: UINavigationController?

    var rootNavigationController: UINavigationController? {
        navigationController
    }

    init(
        navigationController: UINavigationController,
        container: Resolver
    ) {
        self.navigationController = navigationController
        self.container = container

        showCustomNavigationBar()
    }

    func start(in window: UIWindow) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        startApp()
    }

    func startApp() {
        let searchViewController: SearchViewController = container.resolve()
        setViewController(searchViewController)
    }

    private func showCustomNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .appWhite
        navigationController?.navigationBar.backgroundColor = .appWhite
        navigationController?.navigationBar.removeBottomBorder()
    }

}
