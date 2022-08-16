import UIKit
import SeSAC2Framework

class ViewController: UIViewController {

    var name = "고래밥"
    private var age = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        testOpen()
//alert  버튼
//        showSesacAlert(title: "테스트 얼렛", message: "테스트 메세지", buttonTitle: "변경"){ _ in
//            self.view.backgroundColor = .lightGray
//        }

//activity View
//        let image = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's NEW!!"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present) // 네비게이션 컨트롤러가 없기 때문에 present 스타일로 했다.
        
        
        
        
        
    }

}

