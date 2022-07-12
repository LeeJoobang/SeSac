import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet var buttonImageCollection: [UIButton]!
    
    var emotionArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let labelEmotion = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "우헤헤", "사자해"]

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonImage()
        labelDefaultName()
        tagButton()
    }
    
    func buttonImage(){
        for item in 0...buttonImageCollection.count - 1{
            buttonImageCollection[item].setImage(UIImage(named: "sesac_slime\(item+1)"), for: .normal)
        }
    }
    
    func labelDefaultName(){
        for item in 0...labelCollection.count - 1{
            labelCollection[item].text = labelEmotion[item]
            labelCollection[item].textAlignment = .center
        }
    }
    
    func tagButton(){
        for item in 0...buttonImageCollection.count - 1{
            buttonImageCollection[item].tag = item
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        emotionArr[sender.tag] += 1
        labelCollection[sender.tag].text = "\(labelEmotion[sender.tag]) \(String(emotionArr[sender.tag]))"
        labelCollection[sender.tag].textAlignment = .center
        
    }
}

