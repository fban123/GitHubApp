import Combine
import UIKit

class RepositoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: self)

    let imageViewSize = CGSize(width: 24, height: 24)

    var separator: SeparatorView!
    var ownerView: OwnerView!
    var stackView: UIStackView!
    var nameView: IconLabelView!
    var iconContainerView: IconsContainerView!
    var issuesLabel: UILabel!

    var cancellables = Set<AnyCancellable>()

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        cancellables = []
        ownerView.imageView.image = nil
        ownerView.label.text = nil
        nameView.label.text = nil
        iconContainerView.forkView.label.text = nil
        iconContainerView.watchersView.label.text = nil
        issuesLabel.text = nil
    }

    func setData(with model: RepositoryViewModel) {
        ownerView.setData(name: model.ownerName, avatarUrl: model.ownerAvatarUrl)
        iconContainerView.setData(forks: model.numOfForks, watchers: model.numOfWatchers)
        nameView.setData(icon: .repository, text: model.name)
        issuesLabel.text = String(format: LocalizableStrings.issuesRepoFormat.localized, model.numOfIssues)
    }

}

