import UIKit

protocol ReusableViewProtocol { 
    static var reuseIdentifier: String { get }
}



extension UIViewController: ReusableViewProtocol { // extension 저장 프로퍼티 사용 불가
    
    static var reuseIdentifier: String { // 연산프로퍼티일 때 get만 사용한다면 get을 사용할 수 있다.
            return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

