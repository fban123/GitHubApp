import UIKit
import SnapKit

extension OwnerView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        label = UILabel()
        addSubview(label)

        imageView = UIImageView()
        addSubview(imageView)
    }

    func styleViews() {
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .appOrange
        label.textAlignment = .right

        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.roundAllCorners(withRadius: imageViewSize.height / 2)
    }

    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.size.equalTo(imageViewSize)
        }

        label.snp.makeConstraints {
            $0.trailing.equalTo(imageView.snp.leading).offset(-8)
            $0.leading.top.bottom.equalToSuperview()
            $0.centerY.equalTo(imageView)
        }
    }

}
