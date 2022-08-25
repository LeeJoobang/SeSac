import UIKit

class BaseViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureUI(){
        
    }
    
    func setConstraints(){
        
    }
    
    func showAlertMessage(title: String, button: String = "확인") { // 매개변수 기본값
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
//        alert.addAction(UIAlertAction(title: "할일목록", style: .default, handler: { UIAlertAction in
//            print("할일")
//        })
                        
        let ok = UIAlertAction(title: button, style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
    
}
