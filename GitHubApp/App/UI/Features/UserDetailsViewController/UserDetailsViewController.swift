import UIKit
import Combine
import Kingfisher

class UserDetailsViewController: UIViewController {

    private typealias DataSource = UICollectionViewDiffableDataSource<Section, UserRepositoryViewModel>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, UserRepositoryViewModel>

    let imageViewSize = CGSize(width: 160, height: 160)

    var scrollView: UIScrollView!
    var contentView: UIView!
    var firstStackView: UIStackView!
    var createdLabel: UILabel!
    var updatedLabel: UILabel!
    var firstSeparator: SeparatorContainerView!
    var avatarImageView: UIImageView!
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var secondSeparator: SeparatorContainerView!
    var bioLabel: UILabel!
    var userReposTitle: UILabel!
    var collectionView: UICollectionView!
    var secondStackView: UIStackView!
    var thirdSeparator: SeparatorContainerView!
    var locationView: IconLabelView!
    var emailView: IconLabelView!
    var userUrl: String!

    private var cancellables = Set<AnyCancellable>()
    private var dataSource: DataSource!
    private var presenter: UserDetailsPresenter!

    convenience init(presenter: UserDetailsPresenter) {
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
                        withReuseIdentifier: UserRepositoryCollectionViewCell.identifier,
                        for: indexPath) as? UserRepositoryCollectionViewCell
                else {
                    return nil
                }

                cell.setData(with: item)
                return cell
            })
    }

    private func updateSnapshot(items: [UserRepositoryViewModel]) {
        var snapshot = DataSourceSnapshot()
        let sections: [Section] = [.main]
        snapshot.appendSections(sections)
        snapshot.appendItems(items)

        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func bindViews() {
        presenter
            .item
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] item in
                    guard let self = self else { return }

                    self.setData(with: item)
                    self.updateSnapshot(items: item.userRepositories)
                  })
            .store(in: &cancellables)

        usernameLabel
            .tapGesture()
            .sink { [weak self] _ in
                guard let self = self else { return }

                self.presenter.onUsernameTapped(with: self.userUrl)
            }
            .store(in: &cancellables)
    }

    private func setData(with model: UserDetailsViewModel) {
        guard
            let createdText = model.createdAt.formatDate(),
            let updatedText = model.updatedAt.formatDate(),
            let imageUrl = URL(string: model.avatarUrl)
        else {
            return
        }

        createdLabel.text = String(format: LocalizableStrings.createdFormat.localized, createdText)
        updatedLabel.text = String(format: LocalizableStrings.updatedFormat.localized, updatedText)
        avatarImageView.kf.setImage(with: imageUrl)
        nameLabel.text = model.name
        usernameLabel.text = model.username
        bioLabel.text = model.bio
        userReposTitle.text = String(
            format: LocalizableStrings.userRepositoriesTitle.localized,
            model.username)
        locationView.setData(icon: .location, text: model.location)
        emailView.setData(icon: .email, text: model.email)
        userUrl = model.userUrl
    }

}

extension UserDetailsViewController: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }

        presenter.onCellTapped(with: item.repoUrl)
    }

}
