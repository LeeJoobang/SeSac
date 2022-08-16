import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        firstImageView.image = UIImage(named: "image1.png")

    }
}
