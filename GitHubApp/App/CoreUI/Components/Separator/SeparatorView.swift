import UIKit

public class SeparatorView: UIView {

    let defaultHeight: CGFloat = 1

    public init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
