import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        orangeView.layer.cornerRadius = 20
        orangeView.clipsToBounds = false
    }
}

