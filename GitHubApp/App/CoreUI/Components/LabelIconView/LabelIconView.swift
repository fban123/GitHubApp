import UIKit

class LabelIconView: UIView {

    let imageViewSize = CGSize(width: 24, height: 24)

    var label: UILabel!
    var imageView: UIImageView!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with count: Int, image: BundleImage) {
        label.text = String(count)
        imageView.image = UIImage(with: image)
    }

}
