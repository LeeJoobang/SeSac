import UIKit

extension UIViewController {
    
    func transitionViewController<T: UIViewController> (storyboard: String, identifier: String, viewController: T){
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let controller = sb.instantiateViewController(withIdentifier: identifier) as? T else { return }
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


