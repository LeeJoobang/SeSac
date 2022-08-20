import UIKit

class LoginViewController: BaseViewController{
    
    var loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
        loginView.backgroundColor = .black
        //loginView.backgroundColor = .white // default black이네?

    }
    
    override func configureUI() {
        
    }
    
    override func setConstraints() {
        
    }

    
}
