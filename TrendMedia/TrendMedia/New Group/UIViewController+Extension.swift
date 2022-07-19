import UIKit

extension UIViewController {
    
    func setBackgroundColor(){
        view.backgroundColor = .lightGray
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "a", message: "b", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
