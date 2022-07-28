import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
//        UserDefaults.standard.set(false, forKey: "First") // true이면 vc를 띄우고, false이면 Searchmovie 다른 화면에 배치해야함
//        
//        guard let scene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: scene)
//
//        
//        if UserDefaults.standard.bool(forKey: "First") {
//            
//            let sb = UIStoryboard(name: "Trend" , bundle: nil)
//            
//            let vc = sb.instantiateViewController(withIdentifier: "TestSceneViewController") as! TestSceneViewController
//            
//            // 첫 시작화면으로 지정하기
//            window?.rootViewController = vc
//            
//        } else {
//                        
//            let sb = UIStoryboard(name: "Search" , bundle: nil)
//            
//            let vc = sb.instantiateViewController(withIdentifier: "MovieTableViewController") as! MovieTableViewController
//            let nav = UINavigationController(rootViewController: vc)
//            
//            // 첫 시작화면으로 지정하기
//            window?.rootViewController = nav
//        }
//        
        //window?.makeKeyAndVisible() // 버전별 대응 척 화면을 보여주기 위함임!
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

