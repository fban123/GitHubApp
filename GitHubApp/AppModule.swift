import UIKit
import Resolver

class AppModule {

    private lazy var container: Resolver = {
        let container = Resolver()
        registerDependencies(in: container)
        return container
    }()

    lazy var appRouter: AppRouter = container.resolve()

    private func registerDependencies(in container: Resolver) {
        registerAppDependencies(in: container)
        registerClients(in: container)
        registerDataSources(in: container)
        registerUseCases(in: container)
        registerPresenters(in: container)
        registerViewControllers(in: container)
    }

    private func registerAppDependencies(in container: Resolver) {
        container
            .register { AppRouter(
                navigationController: UINavigationController(),
                container: container)
            }
            .scope(.application)

        container
            .register(String.self, name: AppDependencies.apiBaseUrl) {
                "https://api.github.com"
            }
            .scope(.application)

        registerRouters(in: container)
        registerCaches(in: container)
    }

    private func registerRouters(in container: Resolver) {
        container
            .register(SearchRouterProtocol.self) {
                let appRouter: AppRouter = self.container.resolve()
                return appRouter
            }
            .scope(.application)

        container
            .register(RepositoryDetailsRouterProtocol.self) {
                let appRouter: AppRouter = self.container.resolve()
                return appRouter
            }
            .scope(.application)

        container
            .register(UserDetailsRouterProtocol.self) {
                let appRouter: AppRouter = self.container.resolve()
                return appRouter
            }
            .scope(.application)
    }

    private func registerCaches(in container: Resolver) {
        container
            .register { SortCache() }
            .implements(SortCacheProtocol.self)
            .scope(.shared)
    }

    private func registerClients(in container: Resolver) {
        container
            .register { ApiClient(urlSession: URLSession.shared) }
            .implements(ApiClientProtocol.self)
            .scope(.application)

        container
            .register { _ -> BaseApiClient in
                let baseUrl = container.resolve(String.self, name: AppDependencies.apiBaseUrl)
                return BaseApiClient(baseUrl: baseUrl, apiClient: container.resolve())
            }
            .implements(BaseApiClientProtocol.self)
            .scope(.application)

        container
            .register { RepositoryClient(baseClient: container.resolve()) }
            .implements(RepositoryClientProtocol.self)
            .scope(.application)

        container
            .register { UserClient(baseClient: container.resolve()) }
            .implements(UserClientProtocol.self)
            .scope(.application)
    }

    private func registerDataSources(in container: Resolver) {
        container
            .register { RepositoryDataSource(client: container.resolve()) }
            .implements(RepositoryDataSourceProtocol.self)
            .scope(.application)

        container
            .register { UserDataSource(client: container.resolve()) }
            .implements(UserDataSourceProtocol.self)
            .scope(.application)
    }

    private func registerUseCases(in container: Resolver) {
        container
            .register { RepositoryUseCase(dataSource: container.resolve()) }
            .implements(RepositoryUseCaseProtocol.self)
            .scope(.application)

        container
            .register {
                UserUseCase(
                    userDataSource: container.resolve(),
                    repositoryDataSource: container.resolve())
            }
            .implements(UserUseCaseProtocol.self)
            .scope(.application)
    }

    private func registerPresenters(in container: Resolver) {
        container
            .register {
                SearchPresenter(
                    useCase: container.resolve(),
                    sortCache: container.resolve(),
                    router: container.resolve())
            }
            .scope(.unique)

        container
            .register { (_, arg) -> RepositoryDetailsPresenter? in
                return RepositoryDetailsPresenter(
                    identifier: arg(),
                    useCase: container.resolve(),
                    router: container.resolve())
            }
            .scope(.unique)

        container
            .register { (_, arg) -> UserDetailsPresenter? in
                return UserDetailsPresenter(
                    identifier: arg(),
                    useCase: container.resolve(),
                    router: container.resolve())
            }
            .scope(.unique)
    }

    private func registerViewControllers(in container: Resolver) {
        container
            .register { SearchViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { (_, arg) -> RepositoryDetailsViewController? in
                let presenter = container.resolve(RepositoryDetailsPresenter.self, args: arg())
                return RepositoryDetailsViewController(presenter: presenter) }
            .scope(.unique)

        container
            .register { (_, arg) -> UserDetailsViewController? in
                let presenter = container.resolve(UserDetailsPresenter.self, args: arg())
                return UserDetailsViewController(presenter: presenter) }
            .scope(.unique)

        container
            .register { (_, arg) -> WebViewController? in
                return WebViewController(externalLink: arg())
            }
            .scope(.unique)
    }

}

struct AppDependencies {

    static let apiBaseUrl: Resolver.Name = "apiBaseUrl"

}
