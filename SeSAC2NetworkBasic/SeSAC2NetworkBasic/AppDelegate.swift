import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /*
         2. 노티제거(7.29)
         알림 앱 미리 알림 스케쥴 할일 목록 > 하루 전 알림 30분 전 알림. todo list 체크해서 없애면 걔 알림 역시 없애야 한다. 그럼 pending을 통해 지울 수 있는 것이다.
         */
        UNUserNotificationCenter.current().removeAllDeliveredNotifications() // 반복해서 오는 것은 안 지워진다. pending은 앞으로 올 알림에 대해 지우는 것이다.(7.29)
        
        UNUserNotificationCenter.current().delegate = self
    
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .badge, .sound])
        // iOS 14 list, banner <-> alert(7.29)
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("앱 꺼짐!")
    }


}

