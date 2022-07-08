import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet var tagCollection: [UIButton]!
    @IBOutlet weak var oneTagButton: UIButton!
    @IBOutlet weak var twoTagButton: UIButton!
    @IBOutlet weak var threeTagButton: UIButton!
    @IBOutlet weak var fourTagButton: UIButton!
    @IBOutlet weak var displayTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userView.backgroundColor = .black
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        searchButton.layer.cornerRadius = 3.0
        userTextField.layer.cornerRadius = 3.0
        userTextField.layer.borderColor = UIColor.black.cgColor
        userTextField.layer.borderWidth = 1.0
        
    }
    

}

