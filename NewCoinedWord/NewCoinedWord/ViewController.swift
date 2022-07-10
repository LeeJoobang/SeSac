import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var tagCollection: [UIButton]!
    @IBOutlet weak var oneTagButton: UIButton!
    @IBOutlet weak var twoTagButton: UIButton!
    @IBOutlet weak var threeTagButton: UIButton!
    @IBOutlet weak var fourTagButton: UIButton!
    
    @IBOutlet weak var displayLabel: UILabel!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        
        layout()
        button()
        buttonlayout()
    }
    
    func layout(){
        userView.backgroundColor = .black
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        searchButton.layer.cornerRadius = 3.0
        
        userTextField.layer.cornerRadius = 3.0
        userTextField.layer.borderColor = UIColor.black.cgColor
        userTextField.layer.borderWidth = 1.0
        userTextField.placeholder = "찾고자 하는 단어를 입력해주세요."
        
        displayLabel.textAlignment = .center
        displayLabel.textColor = .red
        displayLabel.font = UIFont.systemFont(ofSize: 10)
        displayLabel.numberOfLines = 0
    }
    
    func button(){
        var count = Int()
        let buttonName = ["쫌쫌다리", "억텐", "찐텐", "좋대구알"]

        for hashItem in tagCollection{
            hashItem.setTitle(buttonName[count], for: .normal)
            count += 1
        }
    }
    
    func buttonlayout(){
        for tagButton in tagCollection{
            tagButton.layer.cornerRadius = 8
            tagButton.layer.borderColor = UIColor.black.cgColor
            tagButton.layer.borderWidth = 1
            tagButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func displayMean(_ sender: UIButton) {
        let dic = [oneTagButton:"아주 조금씩 적고 하찮은 양을 모으는 모습", twoTagButton:"억지 텐션",threeTagButton:"진짜 텐션", fourTagButton:"좋아요, 댓글, 구독, 알림설정"]
        
        for item in dic {
            let temp = sender.titleLabel?.text
            let strItem = item.key?.titleLabel?.text
            if temp == strItem {
                displayLabel.text = item.value
            }
        }
    }
    
    @IBAction func searchWord(_ sender: UIButton) {
        let dic = [oneTagButton:"아주 조금씩 적고 하찮은 양을 모으는 모습", twoTagButton:"억지 텐션",threeTagButton:"진짜 텐션", fourTagButton:"좋아요, 댓글, 구독, 알림설정"]
        
        for item in dic {
            let temp = userTextField.text
            let strItem = item.key?.titleLabel?.text
            if temp == strItem {
                displayLabel.text = item.value
            }
        }
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}

