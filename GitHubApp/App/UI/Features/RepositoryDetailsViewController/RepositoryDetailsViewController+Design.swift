import UIKit
import SnapKit

extension RepositoryDetailsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        contentView = UIView()
        scrollView.addSubview(contentView)

        stackView = UIStackView()
        contentView.addSubview(stackView)

        languageLabel = UILabel()
        stackView.addArrangedSubview(languageLabel)

        createdLabel = UILabel()
        stackView.addArrangedSubview(createdLabel)

        updatedLabel = UILabel()
        stackView.addArrangedSubview(updatedLabel)

        nameView = IconLabelView()
        stackView.addArrangedSubview(nameView)

        visibilityLabel = UILabel()
        stackView.addArrangedSubview(visibilityLabel)

        firstSeparator = SeparatorContainerView()
        stackView.addArrangedSubview(firstSeparator)

        descriptionLabel = UILabel()
        stackView.addArrangedSubview(descriptionLabel)

        iconsContainerView = IconsContainerView()
        stackView.addArrangedSubview(iconsContainerView)

        issuesLabel = UILabel()
        stackView.addArrangedSubview(issuesLabel)

        secondSeparator = SeparatorContainerView()
        stackView.addArrangedSubview(secondSeparator)

        authorLabel = UILabel()
        stackView.addArrangedSubview(authorLabel)

        ownerView = OwnerView()
        stackView.addArrangedSubview(ownerView)
    }

    func styleViews() {
        view.backgroundColor = .appWhite

        stackView.axis = .vertical
        stackView.spacing = 12

        languageLabel.textColor = .appBlack
        languageLabel.textAlignment = .right
        languageLabel.font = UIFont.boldSystemFont(ofSize: 12)

        createdLabel.textColor = .appBlack
        createdLabel.textAlignment = .right
        createdLabel.font = UIFont.italicSystemFont(ofSize: 12)

        updatedLabel.textColor = .appBlack
        updatedLabel.textAlignment = .right
        updatedLabel.font = UIFont.italicSystemFont(ofSize: 12)

        visibilityLabel.textColor = .appBlack
        visibilityLabel.textAlignment = .left
        visibilityLabel.font = UIFont.italicSystemFont(ofSize: 12)

        descriptionLabel.textColor = .appBlack
        descriptionLabel.numberOfLines = 0

        issuesLabel.textColor = .appBlack
        issuesLabel.textAlignment = .right
        issuesLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)

        authorLabel.text = LocalizableStrings.authorTitle.localized
        authorLabel.textColor = .appBlack
        authorLabel.textAlignment = .left
        authorLabel.font = UIFont.italicSystemFont(ofSize: 12)
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(24)
        }
    }

}
