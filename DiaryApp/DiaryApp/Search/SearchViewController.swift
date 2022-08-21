import UIKit

class SearchViewController: BaseViewController {
    
    var searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView
        searchView.backgroundColor = .red
    }
            
    override func configureUI() {
    }
    
    override func setConstraints() {
        
    }
    
}
