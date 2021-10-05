import UIKit

extension UIColor {

    static var appWhite: UIColor {
        UIColor(rgb: 0xf5f5f5)
    }

    static var appGrey: UIColor {
        UIColor(rgb: 0xECECEC)
    }

    static var appBlack: UIColor {
        UIColor(rgb: 0x333)
    }

    static var appBlue: UIColor {
        UIColor(rgb: 0x4078C0)
    }

    static var appOrange: UIColor {
        UIColor(rgb: 0xC9510C)
    }

    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

}

