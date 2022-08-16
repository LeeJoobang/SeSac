import Foundation
import UIKit

public protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
