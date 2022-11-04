import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private let personViewModel = PersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personViewModel.personImage.bind { image in
            self.imageView.image = image
        }
        
        personViewModel.name.bind { name in
            self.nameLabel.text = name
        }
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        personViewModel.clickedButton()
    }
    
}
