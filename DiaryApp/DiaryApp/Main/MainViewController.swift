import UIKit

class MainViewController: BaseViewController {
    
    var mainView = MainView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
    
    override func configureUI() {
    }
    
    override func setConstraints() {
        
    }
    
}
