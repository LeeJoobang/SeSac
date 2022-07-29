import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        /* 7.29. 코드
         이게 먼저다!
         badge 제거할 때
         1. 뱃지 제거? > 뱃지는 어느 시점에 제거해주는게 좋을까?
         */
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // 앱을 켰을 때 - 화면을 바꾸는 과정(inactive), 아니면 전화를 잠깐 받았다가 온 상태는 foreground 상태의 함수가 호출이 안된다.(7.29 코드)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

