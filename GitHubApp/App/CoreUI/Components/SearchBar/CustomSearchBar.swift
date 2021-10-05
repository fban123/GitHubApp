import Combine
import UIKit

public class CustomSearchBar: UITextField {

    let height: CGFloat = 64
    let leftViewRectPadding: CGFloat = 12
    let attributedViewSize = CGSize(width: 32, height: 32)

    var leftViewContainer: UIView!
    var leftImageView: UIImageView!
    
    private var cancellables = Set<AnyCancellable>()

    public override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else { return }

            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    NSAttributedString.Key.foregroundColor:
                        UIColor.appBlack.withAlphaComponent(0.5)])
        }
    }

    public init() {
        super.init(frame: CGRect.zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftViewRectPadding
        return textRect
    }

}
