import UIKit
import RealmSwift 

class DetailViewController: BaseViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        detailView.backgroundColor = .white
    }
    
    override func configureUI() {
    }
    
    override func setConstraints() {
    }
}
