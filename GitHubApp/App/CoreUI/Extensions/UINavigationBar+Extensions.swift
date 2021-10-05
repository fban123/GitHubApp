import UIKit

extension UINavigationBar {

    func removeBottomBorder() {
        shadowImage = UIImage()
        layoutIfNeeded()
    }

}
