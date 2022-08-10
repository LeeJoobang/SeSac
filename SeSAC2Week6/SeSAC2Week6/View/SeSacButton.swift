import UIKit
/*
 속성
 @IBDesignable, @objc 같은 것을 속성이라고 한다.
 */


@IBDesignable
class SeSacButton: UIButton {
    //인터페이스 빌더 인스펙터 영역 show역할만 하는데, 반영은 하지 않는다. 그렇다면 누가 할까?? @IBDesignable 클래스 전체에 넣어준다.
    // 인터페이스 빌더 컴파일 시점 실시간으로 객체 속성을 확인할 수 있다.
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
        
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
}
