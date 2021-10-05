import UIKit
import Combine

class SortContainerView: UIView {

    var titleLabel: UILabel!
    var stackView: UIStackView!

    private let selectedSubject = PassthroughSubject<SortTypeViewModel, Never>()
    private var cancellables = Set<AnyCancellable>()

    var selectedSortType: AnyPublisher<SortTypeViewModel, Never> {
        selectedSubject
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    init() {
        super.init(frame: .zero)

        buildViews()
        makeSortViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateViews(with type: SortTypeViewModel) {
        guard let sortViews = self.stackView.arrangedSubviews as? [SortView] else { return }

        sortViews.forEach { sortView in
            sortView.isSelected = sortView.type == type
        }
    }

    private func makeSortViews() {
        SortTypeViewModel.allCases.forEach { type in
            let sortView = SortView(type: type)
            stackView.addArrangedSubview(sortView)

            sortView
                .tapGesture()
                .sink { [weak self] _ in
                    self?.selectedSubject.send(type)
                }
                .store(in: &cancellables)
        }
    }

}
