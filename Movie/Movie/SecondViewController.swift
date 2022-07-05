import UIKit

class SecondViewController: UIViewController {
    
    //@아웃렛 변수
    // 초기화만 해놓고 필요할 때 선언해줘
    @IBOutlet weak var renameImgView: UIImageView!
    //뷰컨트롤러의 생명주기 중 하나이다.
    //사용자에게 화면이 보이기 직전에 해야 하는 것이다.
    @IBOutlet weak var renameTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renameImgView.image = UIImage(named: "movie\(Int.random(in: 1...6))")
        renameImgView.layer.cornerRadius = 10
        renameImgView.layer.borderWidth = 5
        renameImgView.layer.borderColor = UIColor.blue.cgColor
        
        renameTitle.text = "택시운전사"
        renameTitle.backgroundColor = .lightGray
        renameTitle.textColor = .red
        renameTitle.font = .boldSystemFont(ofSize: 30)
    }
    
    @IBAction func changButton(_ sender: Any) {
        renameImgView.image = UIImage(named: "movie\(Int.random(in: 1...6))")

    }
    
}
