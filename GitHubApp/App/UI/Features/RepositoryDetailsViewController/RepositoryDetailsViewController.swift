import UIKit
import Combine

class RepositoryDetailsViewController: UIViewController {

    var scrollView: UIScrollView!
    var contentView: UIView!
    var stackView: UIStackView!
    var languageLabel: UILabel!
    var createdLabel: UILabel!
    var updatedLabel: UILabel!
    var nameView: IconLabelView!
    var visibilityLabel: UILabel!
    var firstSeparator: SeparatorContainerView!
    var descriptionLabel: UILabel!
    var iconsContainerView: IconsContainerView!
    var issuesLabel: UILabel!
    var secondSeparator: SeparatorContainerView!
    var authorLabel: UILabel!
    var ownerView: OwnerView!
    var repoUrl: String!
    var ownerUrl: String!

    private var cancellables = Set<AnyCancellable>()
    private var presenter: RepositoryDetailsPresenter!

    convenience init(presenter: RepositoryDetailsPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        bindViews()
    }

    private func bindViews() {
        presenter
            .item
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] item in
                    self?.setData(with: item)
                  })
            .store(in: &cancellables)

        nameView
            .tapGesture()
            .sink { [weak self] _ in
                guard let self = self else { return }

                self.presenter.onLinkTapped(with: self.repoUrl)
            }
            .store(in: &cancellables)

        ownerView
            .tapGesture()
            .sink { [weak self] _ in
                guard let self = self else { return }

                self.presenter.onLinkTapped(with: self.ownerUrl)
            }
            .store(in: &cancellables)
    }

    private func setData(with model: RepositoryDetailsViewModel) {
        guard
            let createdText = model.createdAt.formatDate(),
            let updatedText = model.updatedAt.formatDate()
        else {
            return
        }

        languageLabel.text = model.language
        createdLabel.text = String(format: LocalizableStrings.createdFormat.localized, createdText)
        updatedLabel.text = String(format: LocalizableStrings.updatedFormat.localized, updatedText)
        nameView.setData(icon: .repository, text: model.name)
        visibilityLabel.text = model.visibility
        descriptionLabel.text = model.description
        iconsContainerView.setData(forks: model.numOfForks, watchers: model.numOfWatchers)
        issuesLabel.text = String(format: LocalizableStrings.issuesRepoFormat.localized, model.numOfIssues)
        ownerView.setData(name: model.ownerName, avatarUrl: model.ownerAvatarUrl)
        repoUrl = model.repoUrl
        ownerUrl = model.ownerUrl
    }

}
