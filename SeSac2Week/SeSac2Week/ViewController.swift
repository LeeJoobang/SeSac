import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emotionOne: UIImageView!
    @IBOutlet weak var emotionTwo: UIImageView!
    @IBOutlet weak var emotionThree: UIImageView!
    @IBOutlet weak var emotionFour: UIImageView!
    @IBOutlet weak var emotionFive: UIImageView!
    @IBOutlet weak var emotionSix: UIImageView!
    @IBOutlet weak var emotionSeven: UIImageView!
    @IBOutlet weak var emotionEight: UIImageView!
    @IBOutlet weak var emotionNine: UIImageView!
    
    @IBOutlet var emotionCollection: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionImage()
    }
    
    func emotionImage(){
        var count = 1
//        let buttonNum = Array<Int>(0...8)
        for item in emotionCollection{
            item.image = UIImage(named: "sesac_slime\(count)")
            count += 1
            
        }
    }

}

