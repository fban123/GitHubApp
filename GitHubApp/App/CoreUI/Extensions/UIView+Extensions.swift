import UIKit

extension UIView {

    func setVisible(_ isVisible: Bool) {
        isHidden = !isVisible
    }

    func toggleVisible() {
        alpha = abs(alpha - 1)
    }

    func roundTopCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    func roundBottomCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    func roundAllCorners(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner]
    }

}
