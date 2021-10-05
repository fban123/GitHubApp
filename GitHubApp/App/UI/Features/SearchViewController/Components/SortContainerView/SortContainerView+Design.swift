import UIKit
import SnapKit

extension SortContainerView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        titleLabel = UILabel()
        addSubview(titleLabel)

        stackView = UIStackView()
        addSubview(stackView)
    }

    func styleViews() {
        titleLabel.textColor = .appBlack
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.italicSystemFont(ofSize: 12)
        titleLabel.text = LocalizableStrings.sortTitle.localized

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }

    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}
