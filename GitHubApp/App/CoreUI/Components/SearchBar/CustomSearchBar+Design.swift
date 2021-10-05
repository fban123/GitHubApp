import UIKit

extension CustomSearchBar: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    public func createViews() {
        leftViewContainer = UIView()
        leftView = leftViewContainer

        leftImageView = UIImageView()
        leftImageView.contentMode = .center
        leftViewContainer.addSubview(leftImageView)
    }

    public func styleViews() {
        backgroundColor = .appWhite
        layer.borderWidth = 1
        layer.borderColor = UIColor.appBlack.withAlphaComponent(0.5).cgColor
        layer.cornerRadius = 8

        textColor = .appBlack
        autocapitalizationType = .none
        autocorrectionType = .no

        leftViewMode = .always
        rightViewMode = .whileEditing
        
        leftImageView.image = UIImage(with: .search).withRenderingMode(.alwaysTemplate)
        leftImageView.tintColor = .appBlack.withAlphaComponent(0.5)
    }

    public func defineLayoutForViews() {
        snp.makeConstraints {
            $0.height.equalTo(height)
        }

        leftImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.size.equalTo(attributedViewSize)
        }
    }

}
