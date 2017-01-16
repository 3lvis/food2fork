import UIKit

extension UIColor {
    class var brandColor: UIColor {
        return UIColor(r: 126, g: 214, b: 82)
    }

    class var backgroundColor: UIColor {
        return UIColor(r: 28, g: 27, b: 27)
    }

    class var darkerBackgroundColor: UIColor {
        return UIColor(r: 18, g: 16, b: 16)
    }

    convenience init(r red: Double, g green: Double, b blue: Double, a alpha: Double = 1) {
        self.init(red: CGFloat(red)/CGFloat(255.0), green: CGFloat(green)/CGFloat(255.0), blue: CGFloat(blue)/CGFloat(255.0), alpha: CGFloat(alpha))
    }
}
