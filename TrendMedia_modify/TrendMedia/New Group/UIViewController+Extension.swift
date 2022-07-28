import UIKit


extension UIViewController {
    func setBackgroundColor() {
        view.backgroundColor = .lightGray
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "경고", message: "잘못됨", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
