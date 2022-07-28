import UIKit

extension UITextField {
    
    func borderColor() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.borderStyle = .none
    }
    
}
