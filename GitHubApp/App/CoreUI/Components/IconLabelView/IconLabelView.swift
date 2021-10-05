import UIKit
import SnapKit

class IconLabelView: UIView {

    let imageViewSize = CGSize(width: 24, height: 24)
    
    var imageView: UIImageView!
    var label: UILabel!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(icon: BundleImage, text: String) {
        guard text != "" else { return }

        imageView.image = UIImage(with: icon)
        label.text = text
    }

}
