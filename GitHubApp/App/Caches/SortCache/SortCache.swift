import Combine

class SortCache: SortCacheProtocol {

    private let sortTypeSubject = CurrentValueSubject<SortTypeViewModel, Never>(.match)

    var type: AnyPublisher<SortTypeViewModel, Never> {
        sortTypeSubject
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    func updateType(with type: SortTypeViewModel) {
        sortTypeSubject.send(type)
    }

}
