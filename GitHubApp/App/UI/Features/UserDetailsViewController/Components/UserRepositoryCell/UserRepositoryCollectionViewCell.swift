import Combine
import UIKit

class UserRepositoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: self)

    var stackView: UIStackView!
    var nameView: IconLabelView!
    var separator: SeparatorContainerView!
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
        nameView.label.text = nil
        iconContainerView.forkView.label.text = nil
        iconContainerView.watchersView.label.text = nil
        issuesLabel.text = nil
    }

    func setData(with model: UserRepositoryViewModel) {
        nameView.setData(icon: .repository, text: model.name)
        iconContainerView.setData(forks: model.numOfForks, watchers: model.numOfWatchers)
        issuesLabel.text = String(format: LocalizableStrings.issuesRepoFormat.localized, model.numOfIssues)
    }

}

