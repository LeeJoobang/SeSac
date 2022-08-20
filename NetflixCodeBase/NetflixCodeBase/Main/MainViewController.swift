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
    }
    
    override func setConstraints() {
        
    }

    
}
