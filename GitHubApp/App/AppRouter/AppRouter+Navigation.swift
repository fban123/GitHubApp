import UIKit

extension AppRouter {

    func presentViewController(_ viewController: UIViewController) {
        presentViewController(viewController, in: rootNavigationController)
    }

    func presentViewController(_ viewController: UIViewController, in navigationController: UINavigationController?) {
        navigationController?.present(viewController, animated: true)
    }

    func pushViewController(_ viewController: UIViewController) {
        pushViewController(viewController, in: rootNavigationController)
    }

    func pushViewController(_ viewController: UIViewController, in navigationController: UINavigationController?) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    func setViewController(_ viewController: UIViewController) {
        setViewController(viewController, in: rootNavigationController)
    }

    func setViewController(_ viewController: UIViewController, in navigationController: UINavigationController?) {
        navigationController?.setViewControllers([viewController], animated: true)
    }

    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        setViewControllers(viewControllers, in: rootNavigationController, animated: animated)
    }

    func setViewControllers(
        _ viewControllers: [UIViewController],
        in navigationController: UINavigationController?,
        animated: Bool
    ) {
        navigationController?.setViewControllers(viewControllers, animated: animated)
    }

    func dismissPresentedViewController() {
        dismissPresentedViewController(in: rootNavigationController)
    }

    func dismissPresentedViewController(in navigationController: UINavigationController?) {
        navigationController?.presentedViewController?.dismiss(animated: true)
    }

    func popViewController() {
        popViewController(in: rootNavigationController)
    }

    func popViewController(in navigationController: UINavigationController?) {
        navigationController?.popViewController(animated: true)
    }

    func popToRootViewController() {
        popToRootViewController(in: rootNavigationController)
    }

    func popToRootViewController(in navigationController: UINavigationController?) {
        navigationController?.popToRootViewController(animated: true)
    }

    func showModal(_ viewController: UIViewController, presentationStyle: UIModalPresentationStyle = .fullScreen) {
        guard let currentViewController = rootNavigationController?.viewControllers.last else { return }

        viewController.modalPresentationStyle = presentationStyle
        currentViewController.present(viewController, animated: true)
    }

    func closeModal() {
        guard
            let currentVc = rootNavigationController?.viewControllers.last,
            let modalVc = currentVc.presentedViewController
        else {
            return
        }

        modalVc.dismiss(animated: true)
    }

}
