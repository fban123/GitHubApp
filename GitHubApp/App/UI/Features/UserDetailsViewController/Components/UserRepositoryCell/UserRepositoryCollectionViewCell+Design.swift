import UIKit
import SnapKit

extension UserRepositoryCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        stackView = UIStackView()
        contentView.addSubview(stackView)

        nameView = IconLabelView()
        stackView.addArrangedSubview(nameView)

        separator = SeparatorContainerView()
        stackView.addArrangedSubview(separator)

        iconContainerView = IconsContainerView()
        stackView.addArrangedSubview(iconContainerView)

        issuesLabel = UILabel()
        stackView.addArrangedSubview(issuesLabel)
    }

    func styleViews() {
        backgroundColor = .appGrey
        roundAllCorners(withRadius: 12)

        stackView.axis = .vertical
        stackView.spacing = 12

        issuesLabel.textColor = .appBlack
        issuesLabel.textAlignment = .right
        issuesLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }

    func defineLayoutForViews() {
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }

}
