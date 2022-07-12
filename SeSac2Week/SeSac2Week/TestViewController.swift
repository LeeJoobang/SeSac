import UIKit

class TestViewController: UIViewController {
//태그값을 가져온다. 모든 태그는 0이다. 구별을 해준다.
    
    @IBOutlet weak var emotionFirstButton: UIButton!
    @IBOutlet weak var emotionFirstLabel: UILabel!
  
    var emotionArr = [0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionFirstButton.tag = 0 // 이거 유용
        emotionFirstLabel.text = setUserNickName()
        view.backgroundColor = example().0
        emotionFirstButton.setImage(UIImage(named: example().2), for: .normal)
    
    }
    
    @IBAction func emotionFirstClicked(_ sender: UIButton) {
//        print(sender.tag, sender.currentTitle, sender.currentImage)
        emotionArr[sender.tag] += 1 // 배열 순서에 맞춰 카운트 1일을 더한다.
        emotionFirstLabel.textAlignment = .center
        emotionFirstLabel.text = "행복감\(emotionArr[0])"
        showAlertController()
    }
    // 배경색, 레이블, 이미지 세트
    func example() -> (UIColor, String, String){
        let color:[UIColor] = [.red, .yellow, .blue]
        let image: [String] = ["sesac_slime6", "sesac_slime7", "sesac_slime8", "sesac_slime9"]
        
        return (color.randomElement()!, "고래밥", image.randomElement()!)
        
    }
    
    func setUserNickName() -> String {
        let nickname = ["고래밥", "칙촉", "격투가"]
        let select = nickname.randomElement()!

        return "저는 \(select)입니다."
    }

    func showAlertController(){
        // 1. 흰색바탕: uialertController
        let alert = UIAlertController(title: "title", message: "여기에 메세지 ", preferredStyle: .alert)
        
        // 2. 버튼을 만들기:
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "취소버튼입니다.", style: .cancel, handler: nil)
        let web = UIAlertAction(title: "새창으로 열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .default, handler: nil)

        // 3. 띄워주기
        alert.addAction(copy)
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(web)

        //4. present
        present(alert, animated: true, completion: nil)
    }
}
