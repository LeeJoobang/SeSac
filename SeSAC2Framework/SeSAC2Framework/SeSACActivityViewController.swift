import UIKit


extension UIViewController{
    public func sesacShowActivityViewController(shareImage: UIImage, shareURL: String, shareText: String) {
        
        let viewController = UIActivityViewController(activityItems: [shareImage, shareURL, shareText], applicationActivities: nil)
        viewController.excludedActivityTypes = [.mail, .assignToContact] // 메일과 연락처 지정등을 제외하고 적용하겠다.
        self.present(viewController, animated: true)
    }
}
