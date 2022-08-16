import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        secondImageView.image = UIImage(named: "image2.png")
    }
}
