import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellowViewLeadingContrstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yellowViewLeadingContrstraint.constant = 120
        
    }


}

