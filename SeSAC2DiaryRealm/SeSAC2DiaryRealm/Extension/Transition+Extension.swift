import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case present // 네비게이션 없이 present
        case presentNavigation // 네비게이션 임베드 present
        case presentFullNavigation // 네비게이션 풀스크린
        case push
    }
    
    func transition<T: UIViewController>(_ viewController: T, transitionStyle: TransitionStyle = .present) {
        
        switch transitionStyle {
        case .present:
//            self.present(T(), animated: true) // viewController 매개변수를 T로 사용
            self.present(viewController, animated: true)
            // 차이가 전혀 없을 것 같은데, 왜냐하면 위에 매개변수에 대한 타입으로 T를 쓰는것인데
            //상수가 아니라, 인스턴스를 따로 만들어버리는구나. 새로운 인스턴스를 생성해버리게 된다.
            // t타입을 선언해버리면 T()에 대한 새로운 인스턴스가 생성이 되는데, 내부매개변수가 자체가 필요없게 된다.
        case .presentNavigation: // 네비게이션 임베드 present, 풀스크린 방식은 아니다.
            let navi = UINavigationController(rootViewController: viewController)
            self.present(navi, animated: true)
        case .push:
            self.navigationController?.pushViewController(viewController, animated: true)
        case .presentFullNavigation: // 네비게이션 임베드 present, 풀스크린 방식 적용
            let navi = UINavigationController(rootViewController: viewController)
            navi.modalPresentationStyle = .fullScreen
            self.present(navi, animated: true)
        }
    }
    
}
