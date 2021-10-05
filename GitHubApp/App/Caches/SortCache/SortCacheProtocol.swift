import Combine

protocol SortCacheProtocol {

    var type: AnyPublisher<SortTypeViewModel, Never> { get }

    func updateType(with type: SortTypeViewModel)

}
