import UIKit

enum NewWord: String, CaseIterable {
    case one = "쫌쫌다리"
    case two = "억텐"
    case three = "찐텐"
    case four = "좋대구알"
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet var tagCollection: [UIButton]!
    @IBOutlet weak var displayLabel: UILabel!
    
    let meanArr = ["아주 조금씩 적고 하찮은 양을 모으는 모습", "억지 텐션", "진짜 텐션", "좋아요, 댓글, 구독, 알림설정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        buttonTag()
        layout()
        buttonName()
        buttonlayout()
    }
    
    func buttonTag(){
        for item in 0...tagCollection.count - 1{
            tagCollection[item].tag = item
        }
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
    
    func buttonName(){
        let newWord = NewWord.allCases
        var count = Int()
        for hashItem in tagCollection{
            hashItem.setTitle(newWord[count].rawValue, for: .normal)
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
    
    @IBAction func touchedHashTagShowMean(_ sender: UIButton) {
        displayLabel.text = meanArr[sender.tag]
    }
    
    @IBAction func searchWord(_ sender: UIButton) {
        let inputWord = userTextField.text ?? "nothing"
        if inputWord == NewWord.one.rawValue {
            displayLabel.text = meanArr[0]
        } else if inputWord == NewWord.two.rawValue {
            displayLabel.text = meanArr[1]
        } else if inputWord == NewWord.three.rawValue {
            displayLabel.text = meanArr[2]
        } else if inputWord == NewWord.three.rawValue {
            displayLabel.text = meanArr[3]
        } else {
            displayLabel.text = "오류"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}

