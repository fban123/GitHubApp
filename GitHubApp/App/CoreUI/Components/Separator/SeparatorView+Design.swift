import UIKit
import SnapKit

extension SeparatorView: ConstructViewsProtocol {

    public func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    public func createViews() {
    }

    public func styleViews() {
        backgroundColor = .appGrey
    }

    public func defineLayoutForViews() {
        snp.makeConstraints {
            $0.height.equalTo(defaultHeight)
        }
    }

}
