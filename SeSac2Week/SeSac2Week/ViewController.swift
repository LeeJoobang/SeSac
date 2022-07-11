import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeView.layer.maskedCorners = [.layerMaxXMaxYCorner] // 오 한쪽만 꺾인다!
        orangeView.layer.cornerRadius = 10
    }
    
    @IBAction func sliderViewChanged(_ sender: UISlider) {
        print("sliderChanged")
    }
    
    @IBAction func keyboardEnter(_ sender: UITextField) {
        print("hi")
    }
}

