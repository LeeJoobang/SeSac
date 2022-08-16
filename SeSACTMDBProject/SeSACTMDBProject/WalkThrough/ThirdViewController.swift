import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        thirdImageView.image = UIImage(named: "image3.png")

    }
    
    @IBAction func nextPageButtonClicked(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "First")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
                
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: TMDBViewController.reuseIdentifier) as! TMDBViewController
        let nav = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
