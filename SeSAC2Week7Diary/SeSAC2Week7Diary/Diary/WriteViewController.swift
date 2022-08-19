import UIKit

class WriteViewController: BaseViewController { // writeviewController는 uiview, baseview 두가지 다!
    
    var mainView = WriteView()
    
    override func loadView() { // super method 호출하면 안된다., viewDidLoad보다 먼저 호출된다.
        self.view = mainView // 현재의 뷰를 mainView로 교체해준다. loadView가 먼저 호출되니까, view 대신 MainView가 나온다.
    }
    
    override func viewDidLoad() { // configure, setconstraint viewdidload에서 호출하지 않아도 됨, 왜냐하면 base에서 호출하고 있으니까!
        super.viewDidLoad()
        
    }
    
    override func configure() { // 모든 뷰 컨트롤러에서 configure method를 가져올 수 있다.
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
    }
    
    @objc func titleTextFieldClicked(_ textField: UITextField){
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요.", button: "확인")
            return
        }
    }
}
