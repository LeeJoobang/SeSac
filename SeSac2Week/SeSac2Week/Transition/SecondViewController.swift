import UIKit

enum UserDefaultKey: String{
    case happyEmotion
}

class SecondViewController: UIViewController {

    //뷰 컨트롤러의 생명주기를 이해할 수 있는 것이다. 이것의 흐름을 잘 기억하는 것이 매우 중요하다.
    
    @IBOutlet weak var mottoTextView: UITextView!
    /*
     1-1. 앱을 킨다 >
     1-2. 데이터를 가져와야 한다.
     1-3. 가져온 데이터를 텍스트 뷰에 보여준다.
     2. 바뀐 데이터를 저장한다.
     => userDefault에 저장한다.
     nickName을 저장할건데, 거기에 공간을 만든다.(key)
     3. nickName이라는 키가 있는지 확인한다.
     4. 앱에 있나? 저장 후 수정
     */
    
    @IBOutlet weak var emotionCountLabel: UILabel!
    
    @IBAction func emotionbuttonClicked(_ sender: UIButton) {
        //기존 값 가져오기
        let currentValue = UserDefaults.standard.integer(forKey: UserDefaultKey.happyEmotion.rawValue)
        
        // 감정 +1
        let updateValue = currentValue + 1
        
        UserDefaults.standard.set(updateValue, forKey: UserDefaultKey.happyEmotion.rawValue)
        
        //레이블에 새로운 내용 보여주기
        emotionCountLabel.text = "\(UserDefaults.standard.integer(forKey: UserDefaultKey.happyEmotion.rawValue))"
    // 상수를 쓰면 되지 않나? 그건 옛날 데이터다.
  //      UserDefaults.standard.removeObject(forKey: <#T##String#>)
        //어떻게 지울 수 있는지 확인하기
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondeTransitionVC", #function)
        
        emotionCountLabel.text = "\(UserDefaults.standard.integer(forKey: UserDefaultKey.happyEmotion.rawValue))"
        
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            mottoTextView.text = UserDefaults.standard.string(forKey: "nickname")
        } else {
            //초기값, 값이 없을 경우
            mottoTextView.text = "고래밥"
        }
        // 가지고 와야 함
                
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondeTransitionVC", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondeTransitionVC", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondeTransitionVC", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondeTransitionVC", #function)
    }
    
    
    @IBAction func saveButtonClieckd(_ sender: Any) {
        
        UserDefaults.standard.set(mottoTextView.text, forKey: "nickname") // 닉네임 키값을 생성하는 것이다.
        print("저장되었습니다.")
    }
    
}
