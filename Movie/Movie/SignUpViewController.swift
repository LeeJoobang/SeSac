import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var membershipButton: UIButton!
    @IBOutlet weak var addInfoLabel: UILabel!
    @IBOutlet weak var addInfoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        labelInfo()
        passwordSecure()
        textFieldInfo()
        textFieldStyle()
        buttonInfo()
        buttonStyle()
        switchInfo()
    }
    
    func labelInfo(){
        titleLabel.text = "JooFlix"
        addInfoLabel.text = "추가 정보 입력"

        titleLabel.textColor = .red
        addInfoLabel.textColor = .white

        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        addInfoLabel.font = UIFont.systemFont(ofSize: 20)
    }
        
    func passwordSecure(){
        if passwordTextField.text?.count != nil {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    func textFieldInfo(){
        let textFieldDic = [emailTextField:"이메일 주소 또는 전화번호", passwordTextField:"비밀번호", nickNameTextField:"닉네임", locationTextField:"위치", codeTextField:"추천 코드 입력"]
        
        for textItem in textFieldDic {
            textItem.key?.textColor = .white
            textItem.key?.font = UIFont.systemFont(ofSize: 20)
            textItem.key?.textAlignment = .center
            textItem.key?.attributedPlaceholder = NSAttributedString(string: textItem.value, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    }
    
    func textFieldStyle(){
        let textFieldArr = [emailTextField, passwordTextField, nickNameTextField, locationTextField, codeTextField]
        
        for textStyleItem in textFieldArr {
            textStyleItem?.layer.cornerRadius = 5.0
            textStyleItem?.layer.borderWidth = 1.5
            textStyleItem?.layer.borderColor = UIColor.lightGray.cgColor
            textStyleItem?.borderStyle = .line
            textStyleItem?.backgroundColor = .gray
            textStyleItem?.keyboardType = .default
        }
    }
    
    func buttonInfo(){
        membershipButton.setTitle("회원가입", for: .normal)
        membershipButton.setTitleColor(UIColor.black, for: .normal)
        membershipButton.backgroundColor = .white
    }
    
    func buttonStyle(){
        membershipButton.layer.cornerRadius = 5.0
        membershipButton.layer.borderWidth = 1.5
        membershipButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func switchInfo(){
        addInfoSwitch.onTintColor = .red
        addInfoSwitch.setOn(true, animated: false)
        addInfoSwitch.thumbTintColor = .white
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ emailTextField: UITextField, _ passwordTextField: UITextField) -> Bool {
        return true
    }
}
