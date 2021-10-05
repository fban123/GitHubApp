import UIKit

class SeparatorContainerView: UIView {

    var separator: SeparatorView!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
