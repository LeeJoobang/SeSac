import UIKit
import SnapKit

class LoginView: BaseView{
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "JACKFLIX"
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let emailTextField: LoginTextField = {
        let view = LoginTextField()
        view.textAlignment = .center
        
        view.attributedPlaceholder = NSAttributedString(
            string: "이메일 주소 또는 전화번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        return view
    }()
    
    let passwordTextField: LoginTextField = {
        let view = LoginTextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        return view
    }()
    
    let nicknameTextField: LoginTextField = {
        let view = LoginTextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        return view
    }()
    
    let locationTextField: LoginTextField = {
        let view = LoginTextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "위치",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        return view
    }()
    
    let codeTextField: LoginTextField = {
        let view = LoginTextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "추천 코드 입력",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { // protocol 문법 구조를 지켜주기 위해서
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            make.centerY.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            make.centerY.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.7)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(10)

            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(self.nicknameTextField.snp.bottom).offset(10)

            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(self.locationTextField.snp.bottom).offset(10)

            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        
    }
}
