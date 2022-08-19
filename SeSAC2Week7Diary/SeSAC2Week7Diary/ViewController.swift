import UIKit
import SeSAC2Framework
import SnapKit

class ViewController: UIViewController {
    
    let nameButton: UIButton = {
        let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.backgroundColor = .black
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
             
        configure()
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("saveButtonNotification"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification){
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameButton.setTitle(name, for: .normal)
        }
        
    }
    
    @objc func nameButtonClicked(){
        
        NotificationCenter.default.post(name: NSNotification.Name("TEST"), object: nil, userInfo: ["name":"\(Int.random(in: 1...100))", "value":123456])

        
        let vc = profileViewController()

        vc.saveButtonActionHandler = { name in
            self.nameButton.setTitle(name, for: .normal)
        }
        
        present(vc, animated: true)
        
//        let vc = profileViewController()
//        present(vc, animated: true)
        
    }
    
    func configure(){
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }
}


/* 7주차 월요일 작성한 코드
 override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     
     let vc = CodeSnapViewController()
     vc.modalPresentationStyle = .overFullScreen
     present(vc, animated: true)
     
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
*/

