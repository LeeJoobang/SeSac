import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emotionCollection: [UIImageView]!
    @IBOutlet var nameCollection: [UILabel]!
    @IBOutlet var buttonCollection: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        emotionImage()
        emotionName()
    }
    
    func emotionImage(){
        var count = 1
        for item in emotionCollection{
            item.image = UIImage(named: "sesac_slime\(count)")
            count += 1
        }
    }
    
    func emotionName(){
        let nameArr = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "어이해", "호호해"]
//        var count = Int()
        for index in 0...nameCollection.count - 1{
            nameCollection[index].text = "\(nameArr[index])\(count)"
        }
    }
    
    func buttonName(){
        let nameArr = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "어이해", "호호해"]
        for index in 0...buttonCollection.count - 1{
            buttonCollection[index].titleLabel?.text = nameArr[index]
        }

    }
    
    

    @IBAction func countButton(_ sender: UIButton) {
        buttonName()
        print(sender.titleLabel?.text)
        let nameArr = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "어이해", "호호해"]
        var tmpKey = sender.titleLabel?.text ?? "nothing"
        for item in nameArr{
            if item == tmpKey {
                count += 1
            }
        }
        
    }
    
    
}

