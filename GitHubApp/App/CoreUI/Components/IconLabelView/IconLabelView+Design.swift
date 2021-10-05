import UIKit
import SnapKit

extension IconLabelView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        imageView = UIImageView()
        addSubview(imageView)

        label = UILabel()
        addSubview(label)
    }

    func styleViews() {
        label.textColor = .appBlue
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
    }

    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.size.equalTo(imageViewSize)
        }

        label.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
        }
    }

}
