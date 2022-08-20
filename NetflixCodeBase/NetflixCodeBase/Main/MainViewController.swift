import UIKit

class MainViewController: BaseViewController{
    
    var mainView = MainView()
    
    override func loadView() {
        self.view = mainView
        configureUI()
    }
    
    override func configureUI() {
        mainView.logoButton.addTarget(self, action: #selector(logoButtonClicked), for: .touchUpInside)
    }
    
    @objc func logoButtonClicked() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
//        self.navigationController?.pushViewController(vc, animated: true)
// 현재 logo를 클릭하면 회원가입할 수 있는 뷰로 넘기려고 하였다. 그러나, push 처리를 하지 못하였음. 이때 어떻게 처리하면 좋을지,,,,,,,,질문!
    }
    
    override func setConstraints() {
        
    }

    
}
