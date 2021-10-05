import UIKit
import SnapKit
import Combine

class SearchViewController: UIViewController {

    private typealias DataSource = UICollectionViewDiffableDataSource<Section, RepositoryViewModel>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, RepositoryViewModel>

    let searchBarInset: CGFloat = 32
    let octocatImageViewSize = CGSize(width: 76, height: 64)

    var octocatImageView: UIImageView!
    var logoImageView: UIImageView!
    var searchBar: CustomSearchBar!
    var sortContainerView: SortContainerView!
    var collectionView: UICollectionView!
    var messageLabel: UILabel!

    private var cancellables = Set<AnyCancellable>()
    private var dataSource: DataSource!
    private var presenter: SearchPresenter!

    convenience init(presenter: SearchPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        makeDataSource()
        bindViews()
    }

    private func makeDataSource() {
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RepositoryCollectionViewCell.identifier,
                        for: indexPath) as? RepositoryCollectionViewCell
                else {
                    return nil
                }

                cell.setData(with: item)

                cell.ownerView
                    .tapGesture()
                    .sink { [weak self] _ in
                        self?.presenter.onOwnerTapped(with: item.ownerName)
                    }
                    .store(in: &cell.cancellables)

                cell.nameView
                    .tapGesture()
                    .sink { [weak self] _ in
                        self?.presenter.onRepoTapped(with: item.fullName)
                    }
                    .store(in: &cell.cancellables)

                return cell
            })
    }

    private func updateSnapshot(items: [RepositoryViewModel]) {
        var snapshot = DataSourceSnapshot()
        let sections: [Section] = [.main]
        snapshot.appendSections(sections)
        snapshot.appendItems(items)

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func bindViews() {
        presenter
            .sortType
            .sink { [weak self] type in
                self?.sortContainerView.updateViews(with: type)
            }
            .store(in: &cancellables)

        sortContainerView
            .selectedSortType
            .sink { [weak self] type in
                self?.presenter.updateSortCache(with: type)
            }
            .store(in: &cancellables)

        searchBar
            .rxText
            .combineLatest(presenter.sortType)
            .flatMap { [weak self] text, sortType -> AnyPublisher<[RepositoryViewModel], Never> in
                guard let self = self else { return .empty() }

                return self.presenter
                    .queryRepositories(with: text, sortType: sortType)
            }
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] items in
                    guard let self = self else { return }

                    self.updateSnapshot(items: items)
                    self.updateBackgroundView()
                })
            .store(in: &cancellables)
    }

    private func updateBackgroundView() {
        guard
            searchBar.text != "",
            dataSource.snapshot().itemIdentifiers.isEmpty
        else {
            collectionView.backgroundView?.isHidden = true
            return
        }

        collectionView.backgroundView?.isHidden = false
    }

}

extension SearchViewController: UICollectionViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }

}
