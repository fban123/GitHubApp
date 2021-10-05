import UIKit
import Kingfisher

class OwnerView: UIView {

    let imageViewSize = CGSize(width: 48, height: 48)

    var label: UILabel!
    var imageView: UIImageView!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(name: String, avatarUrl: String) {
        guard let url = URL(string: avatarUrl) else { return }

        label.text = name
        imageView.kf.setImage(with: url)
    }

}
