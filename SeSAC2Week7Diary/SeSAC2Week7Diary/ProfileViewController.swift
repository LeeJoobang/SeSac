import UIKit
import SnapKit

extension NSNotification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}

class profileViewController: UIViewController{
    
    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.backgroundColor = .black
        return view
    }()
    
    let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "이름을 입력하세요."
        view.backgroundColor = .brown
        view.textColor = .white
        return view
    }()
    
    
    func configure(){
        [saveButton, nameTextField].forEach { view.addSubview($0) }
        
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(50)
            make.top.equalTo(50)
            make.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.center.equalTo(view)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        view.backgroundColor = .white
        
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: Notification.Name("TEST"), object: nil)

    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification){
        print(#function)
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameTextField.text = name
        }
        
    }
    
    var saveButtonActionHandler: ((String) -> ())? // 왜 옵셔널? 프로필 떴을 때, !, 초기화가 잘모ㅓㅅ된면 앱이 꺼질 수 있기 대문이다.

    @objc func saveButtonClicked() {
        // 값 전달 기능 실행 => closure 구문 실행
// 1. 클로져        saveButtonActionHandler?(nameTextField.text!) // 왜 물음표가 붙나? 타입 자체가 옵셔널이기 때문이다.
        
// 2. notification
        NotificationCenter.default.post(name: .saveButton, object: nil, userInfo: ["name":nameTextField.text!, "value":123456])
        
        // 화면 dismiss
        dismiss(animated: true)
    }
    
}
