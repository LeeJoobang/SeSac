import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomImage()
        imageRound()
    }
    
    @IBAction func changeButton(_ sender: Any) {
        randomImage()
    }
    
    func randomNumberArr()->[Int]{
        let movieNum = Array(1...20)
        let shuffleMoive = movieNum.shuffled()
        return shuffleMoive
    }
    
    func randomImage(){
        let randomList = randomNumberArr()
        posterImage.image = UIImage(named: "movie\(randomList[0])")
        firstImage.image = UIImage(named: "movie\(randomList[1])")
        secondImage.image = UIImage(named: "movie\(randomList[2])")
        thirdImage.image = UIImage(named: "movie\(randomList[3])")
    }
    
    func imageRound(){
        firstImage.layer.cornerRadius = 0.5 * firstImage.bounds.size.width
        secondImage.layer.cornerRadius = 0.5 * secondImage.bounds.size.width
        thirdImage.layer.cornerRadius = 0.5 * thirdImage.bounds.size.width
        
    }
    
}
