import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel()
    }
    
    func nameLabel(){
        titleLabel.text = "JooFlix"
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
    }
    
}
