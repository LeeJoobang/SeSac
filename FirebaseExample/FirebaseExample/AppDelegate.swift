//
//  AppDelegate.swift
//  FirebaseExample
//
//  Created by Jooyoung Lee on 2022/10/05.
//

import UIKit
import FirebaseCore
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: firebase 초기화 코드 추가
        FirebaseApp.configure()
        
        // MARK: 알림 시스템에 앱을 등록하는 과정
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        // MARK: 메시지 대리자 설정
        Messaging.messaging().delegate = self
        
        // MARK: 현재 등록 토큰 가져오기 - 주석처리 가능
//        Messaging.messaging().token { token, error in
//            if let error = error {
//                print("Error fetching FCM registration token: \(error)")
//            } else if let token = token {
//                print("FCM registration token: \(token)")
//            }
//        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

// MARK: UNUserNotificationCenterDelegate - delegate extension으로 표현
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // MARK: 재구성 사용 중지됨: APNs 토큰과 등록 토큰 매핑
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // MARK: 포그라운드 알림 수신: 로컬 / 푸시 동일
    // 카카오톡: 도이님과 채팅방, 푸시마다, 화면마다 설정 할 수 있다.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // MARK: .banner, .list: iOS 14+
        completionHandler([.badge, .sound, .banner, .list])
    }
    
    //푸시 클릭: 쿠팡 - 호두과자 클릭 바로 열리는 것이 아니라, 호두과자 장바구니 담는 화면까지
    // 특정 푸시를 클릭하면 특정 상세 화면으로 화면 전환을 해주고 싶다.
    // MARK: 사용자가 푸시를 클릭했을 때만 수신 확인 가능
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("사용자가 푸시를 클릭했습니다.")
        print(response.notification.request.content.body) // 알림 메세지의 내용을 출력할 수 있음.
        print(response.notification.request.content.userInfo) // 알림 메세지의 내용을 출력할 수 있음.
        
        let userInfo = response.notification.request.content.userInfo
        
        if userInfo[AnyHashable("sesac")] as? String == "project" {
            print("SESAC PROJECT")
        } else {
            print("NOTHING")
        }
        

        guard let viewController = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController?.topViewController else { return }
        print(viewController)
        
        //is - class의 instance를 비교할 때 사용
        if viewController is ViewController {
            viewController.navigationController?.pushViewController(SettingViewController(), animated: true)
        }
        
        if viewController is ProfileViewController {
            viewController.dismiss(animated: true)
        }
        
    }
}

// MARK: MessagingDelegate - delegate extension으로 표현
extension AppDelegate: MessagingDelegate {
    
    // MARK: 토큰 갱신 모니터링, 토큰 정보가 언제 바뀔까?
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
    }
    
    
}
