
import UIKit

class ClosureViewController: UIViewController {

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var purpleView: UIView!

    // storyboard 상 없다. 그러나 frame based
    // 어떻게 추가할까?
    // 비율로 잡는게 어렵다.
    var sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         autoresizing을 오토레이아웃 제약조건처럼 설정해주는 기능이 내부적으로 구현되어 있음.
         이 기능은 코드로 짜져 있는지, 인터페이스로 짜져 있는지에 따라 다르다.
         이 기능은 defualt가 true가 그래서 autolayout을 지정해주면 오토리사이징을 안쓰겠다는 의미인 false로 상태가 내부적으로 변경됨.
         오토리사이징 값과 오토레이아웃의 값이 충돌하게 된다. 둘중에 어떤 것을 써야 할지 모른다.
         코드 기반 ui > true
         인터페이스 빌더 기반 레이아웃 ui > false
         
         */
        
        print(purpleView.translatesAutoresizingMaskIntoConstraints)
        print(sampleButton.translatesAutoresizingMaskIntoConstraints)
        print(cardView.translatesAutoresizingMaskIntoConstraints)
        // => print하니 bool값으로 확인된다. 뭐지?
        
        // 위치, 크기, 추가
        sampleButton.frame = CGRect(x: 100, y: 400, width: 100, height: 100)
        sampleButton.backgroundColor = .red
        view.addSubview(sampleButton)
        
        // 프레임은 고려요소가 너무 많다. 그래서 오토레이아웃으로 짤 수 있게 된다.
        
        
        cardView.posterImageView.backgroundColor = .red
        cardView.likeButton.backgroundColor = .yellow
        cardView.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func likeButtonClicked(){
        print("버튼 클릭")
    }
    
    
    @IBAction func colorPickerButtonClicked(_ sender: UIButton) {
        showAlert(title: "컬러피커", message: nil, okTitle: "띄우기") {
            let picker = UIColorPickerViewController()
            self.present(picker, animated: true)
        } // current parameter - okAction 생략됨
    }
    
    @IBAction func backgroundColorChanged(_ sender: UIButton) {
        showAlert(title: "배경색 변경", message: "바꾸시겠습니까?", okTitle: "바꾸기") {
            self.view.backgroundColor = .gray
        }
    }
}

extension UIViewController {
    func showAlert(title: String, message: String?, okTitle: String, okAction: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .default)
        let ok = UIAlertAction(title: okTitle, style: .default) { action in
            okAction()
            // 파라미터가 함수가 들어오기 때문에 함수 호출 연산자'()'를 추가로 작성해줘야 한다.
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
