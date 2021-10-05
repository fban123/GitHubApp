import UIKit
import SnapKit

extension SeparatorContainerView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        separator = SeparatorView()
        addSubview(separator)
    }

    func styleViews() {
    }

    func defineLayoutForViews() {
        separator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
    }

}
