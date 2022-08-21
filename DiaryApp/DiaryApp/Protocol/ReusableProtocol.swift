import UIKit
protocol ReusableProtocol {
    static var reusableIdentifier: String { get }
}

extension UIViewController: ReusableProtocol{
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
