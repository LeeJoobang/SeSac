import UIKit

class BaseViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
        
    }
    
    func configureUI(){
        
    }
    
    func setConstraints(){
        
    }
    
    func showAlertMessage(title: String, button: String = "확인") { // 매개변수 기본값
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: button, style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
    
}
