import UIKit
import SnapKit

extension SortView: ConstructViewsProtocol {

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
        label.textColor = .appBlack
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
    }

    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.size.equalTo(imageSize)
        }

        label.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(4)
            $0.centerY.equalTo(imageView)
            $0.trailing.top.bottom.equalToSuperview()
        }
    }

}
