import UIKit
import SnapKit

class CodeSnap2ViewController: UIViewController {
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [redView, blackView].forEach { view.addSubview($0) } // addsubview가 되는 순서대로 레이아웃의 중첩 순서를 나타낸다.
        
        redView.addSubview(yellowView)
        // 헷갈리지 말자. containerView, stackview의 경우 다른 메서드를 써야 한다.
        
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        // RTL(아랍) LTR(서구)
        blackView.snp.makeConstraints { make in
            make.edges.equalTo(redView).offset(50) // 왼쪽, 상단으로 50 이동한다.
        }


    }
    

}
