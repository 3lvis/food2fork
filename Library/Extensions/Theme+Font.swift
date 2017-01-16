import UIKit

extension UIFont {
    class func light(size: Double) -> UIFont {
        return UIFont(name: "AvenirNext-Light", size: CGFloat(size))!
    }

    class func regular(size: Double) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: CGFloat(size))!
    }

    class func medium(size: Double) -> UIFont {
        return UIFont(name: "AvenirNext-Medium", size: CGFloat(size))!
    }

    class func bold(size: Double) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: CGFloat(size))!
    }
}
