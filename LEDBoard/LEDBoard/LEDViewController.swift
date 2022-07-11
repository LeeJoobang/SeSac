import UIKit
//import CoreLocation: 이 박스를 가져와야 위치 정보를 가져올 수 있다. 필요한 코드를 가져다 쓰고 싶다면 그에 적절한 박스를 알아서 가져와야한다.
//cmd + shift + 0(int) 여러 킷의 종류를 활용할 수 있다. watchKit, WidgetKit 등등 이 있다. 너무 많은데?? 필요할 때 만들어서 쓴다.

class LEDViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet weak var textFieldView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        userTextField.delegate = self // 1번 기능 구현을 위해 delegate 채택
        
        designButton(_: sendButton, buttonTitle: "전송", highlighted: "눌러라", color: .red)
        designButton(_: textColorButton, buttonTitle: "컬러", highlighted: "골라라", color: .white)
        
        designTextField()
        studyOutletCollection()
    }

    func designTextField(){
        userTextField.placeholder = "표시할 내용을 작성해주세요."
        userTextField.text = "안녕하세요"
        userTextField.keyboardType = .emailAddress
    }
    
    func designButton(_ buttonName: UIButton, buttonTitle: String, highlighted: String, color: UIColor){ // + 연산자, = 등위 연산자 ! 강제 해제 연산자 ()함수 호출 연산자
        
        buttonName.backgroundColor = color
        
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(highlighted, for: .highlighted) // 버튼을 꾸욱 누르면 반영이 된다. .highlighted는 버튼의 상태값을 뜻한다
        buttonName.setTitleColor(color, for: .normal) // 글자색
        buttonName.setTitleColor(color, for: .highlighted) // 글자색
    }
    
    func studyOutletCollection(){
        for item in buttonList {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textFieldView.isHidden = !(textFieldView.isHidden)
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        resultLabel.text = userTextField.text
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true) // 탭 동작을 하게 될 경우에 뷰에서 더이상 수정을 하지 않겠다. 그 상태가 true 이기 때문에 키보드도 사라진다.
    }
    
    // 1. keyboard - return 터치시 키보드 사라지는 기능
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        if (userTextField.text?.isEmpty ?? true){
    //            textField.resignFirstResponder()
    //        } else {
    //            textField.resignFirstResponder()
    //        }
    //        return true
    //    }
    // 2. did End on Exit 이벤트를 활용해 return 키보드 숨기기
    @IBAction func keyboardStatus(_ sender: UITextField) {
        print("hi")
    }
}
