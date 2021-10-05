extension AppRouter: RepositoryDetailsRouterProtocol {

    func goToWebView(with url: String) {
        guard Environment.current != .staging else { return }

        let vc: WebViewController = container.resolve(args: url)
        pushViewController(vc)
    }

}
