import UIKit

class SortView: UIView {

    let imageSize = CGSize(width: 24, height: 24)

    let type: SortTypeViewModel

    var label: UILabel!
    var imageView: UIImageView!

    var isSelected: Bool = false {
        didSet {
            styleComponents()
        }
    }

    init(type: SortTypeViewModel) {
        self.type = type
        super.init(frame: .zero)

        buildViews()
        makeType()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeType() {
        label.text = type.rawValue
        styleComponents()
    }

    private func styleComponents() {
        label.font = isSelected
            ? .systemFont(ofSize: 14, weight: .bold)
            : .systemFont(ofSize: 12, weight: .light)
        let bundleImage: BundleImage = isSelected ? .checked : .unchecked
        imageView.image = UIImage(with: bundleImage)
    }

}
