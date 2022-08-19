import UIKit

extension UIViewController {
    
    // tmdb transition 관련된 method 적용해보기
    func transitionViewController<T: UIViewController> (storyboard: String, viewController vc: T){
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let controller = sb.instantiateViewController(withIdentifier: String(describing: vc)) as? T else { return }
        self.present(controller, animated: true)
    }
}


