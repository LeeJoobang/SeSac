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
        
        button()
        buttonForm()

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
    

    func button(){
        oneTagButton.setTitle("쫌쫌따리", for: .normal)
        twoTagButton.setTitle("억텐", for: .normal)

        threeTagButton.setTitle("찐텐", for: .normal)

        fourTagButton.setTitle("좋대구알", for: .normal)

    }
    
    func buttonForm(){
        oneTagButton.layer.cornerRadius = 8
        oneTagButton.layer.borderColor = UIColor.black.cgColor
        oneTagButton.layer.borderWidth = 1
        oneTagButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        twoTagButton.layer.cornerRadius = 8
        twoTagButton.layer.borderColor = UIColor.black.cgColor
        twoTagButton.layer.borderWidth = 1
        twoTagButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        threeTagButton.layer.cornerRadius = 8
        threeTagButton.layer.borderColor = UIColor.black.cgColor
        threeTagButton.layer.borderWidth = 1
        threeTagButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        fourTagButton.layer.cornerRadius = 8
        fourTagButton.layer.borderColor = UIColor.black.cgColor
        fourTagButton.layer.borderWidth = 1
        fourTagButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
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
    
//    @IBAction func keyboardStatus(_ sender: UITextField) {
//    }
//
  
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

