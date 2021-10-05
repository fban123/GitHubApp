import UIKit
import SnapKit

extension RepositoryCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        separator = SeparatorView()
        contentView.addSubview(separator)

        ownerView = OwnerView()
        contentView.addSubview(ownerView)

        stackView = UIStackView()
        contentView.addSubview(stackView)

        nameView = IconLabelView()
        stackView.addArrangedSubview(nameView)

        iconContainerView = IconsContainerView()
        stackView.addArrangedSubview(iconContainerView)

        issuesLabel = UILabel()
        stackView.addArrangedSubview(issuesLabel)
    }

    func styleViews() {
        issuesLabel.textColor = .appBlack
        issuesLabel.textAlignment = .right
        issuesLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)

        stackView.axis = .vertical
        stackView.spacing = 12
    }

    func defineLayoutForViews() {
        separator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(32)
        }

        ownerView.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(24)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(ownerView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }

}
