import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var nickNameLabel: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var codeLabel: UITextField!
    
    
    @IBOutlet weak var membershipLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textInfo()
        fontInfo()
        boxColor()
    }
    
    func textInfo(){
        titleLabel.text = "JooFlix"
        emailLabel.text = "이메일 주소 또는 전화번호"
        passwordLabel.text = "비밀번호"
        nickNameLabel.text = "닉네임"
        locationLabel.text = "위치"
        codeLabel.text = "추천 코드 입력"
        membershipLabel.text = "회원가입"
    }
    
    func fontInfo(){
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        
        emailLabel.textColor = .white
        emailLabel.font = UIFont.systemFont(ofSize: 20)
        emailLabel.textAlignment = .center
        
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont.systemFont(ofSize: 20)
        passwordLabel.textAlignment = .center
        
        nickNameLabel.textColor = .white
        nickNameLabel.font = UIFont.systemFont(ofSize: 20)
        nickNameLabel.textAlignment = .center
        
        locationLabel.textColor = .white
        locationLabel.font = UIFont.systemFont(ofSize: 20)
        locationLabel.textAlignment = .center
        
        codeLabel.textColor = .white
        codeLabel.font = UIFont.systemFont(ofSize: 20)
        codeLabel.textAlignment = .center
        
        membershipLabel.textColor = .black
        membershipLabel.font = UIFont.systemFont(ofSize: 20)
        membershipLabel.textAlignment = .center
    }
    
    func boxColor(){
        emailLabel.backgroundColor = .gray
        passwordLabel.backgroundColor = .gray
        nickNameLabel.backgroundColor = .gray
        locationLabel.backgroundColor = .gray
        codeLabel.backgroundColor = .gray
        
    }
    
    
    
    
    
}
