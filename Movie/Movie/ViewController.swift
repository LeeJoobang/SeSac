import UIKit

class ViewController: UIViewController{
   
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        posterImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        firstImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        secondImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        thirdImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
  
        firstImage.layer.cornerRadius = 0.5 * firstImage.bounds.size.width
        secondImage.layer.cornerRadius = 0.5 * firstImage.bounds.size.width
        thirdImage.layer.cornerRadius = 0.5 * firstImage.bounds.size.width

    }
    
    @IBAction func changeButton(_ sender: Any) {
        posterImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        firstImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        secondImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        thirdImage.image = UIImage(named: "movie\(Int.random(in: 1...20))")
    }
}
