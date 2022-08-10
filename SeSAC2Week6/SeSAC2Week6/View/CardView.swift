import UIKit
/*
 xml interface Builder
 1. uiview custom class지정하기 = 여러가지 뷰를 하나의 파일에서 관리가 가능하다.
 2. 파일의 주인을 file's owner = 지정하게 되면 여러가지 뷰 컨트롤러에서 쓸 수 있는 자유도가 높아진다. 그러나 2개이상 하기 어렵다. 활용도가 높지만, 여러 view제약
 
 */
/*
 view:
 - 인터페이스 빌더 ui <-> 코드 ui 초기화 구문이 다르다.
  - 프로토콜 초기화 구문
 - 코드 ui 초기화 구문: override init
 
 */

protocol A {
    func example()
    init()
    
}

class CardView: UIView {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .lightGray
        self.addSubview(view)
        
        
        // 카드뷰를 인터페이스 빌러 기반으로 만들고, 레이아웃도 설정했는데 false가 아닌 true로 나온다.
        
        print(view.translatesAutoresizingMaskIntoConstraints)
        

    }
    
}
