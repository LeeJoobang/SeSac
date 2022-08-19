import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
    }
    
    func configure(){
        
    }
    
    func setConstraints(){
        
    }
    
    func showAlertMessage(title: String, button: String){ // 거의 모든 view에서 alert을 한다고 가정한다.
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
}
