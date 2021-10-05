import UIKit
import SnapKit

extension LabelIconView: ConstructViewsProtocol {

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
        label.textColor = .appBlack
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
    }

    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing).offset(8)
            $0.size.equalTo(imageViewSize)
        }

        label.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.centerY.equalTo(imageView)
        }
    }

}
