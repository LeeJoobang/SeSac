import UIKit

class MainViewController: BaseViewController {

    var mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        
        mainView.backgroundColor = UIColor.white
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    @objc func searchButtonClicked() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func configureUI() {
    }
    
    override func setConstraints() {
        
    }
    
}
