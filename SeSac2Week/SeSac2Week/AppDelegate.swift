
import UIKit
import IQKeyboardManagerSwift // 1번

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true // iq키보드 사용하는데 있어 활성화 2번 수행
        // 키보드 영역에 텍스트 필드가 있어서 가려지는 경우, 텍스트 필드 만큼 키보드를 자동으로 올려줬다가 내려줍니다.
        
        
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}

