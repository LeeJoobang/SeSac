//
//  AppDelegate.swift
//  LEDBoard
//
//  Created by Joobang Lee on 2022/07/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        sleep(5)
        
        return true
        //런치스크린 딜레이 시간 코드
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //melon, youtube 같은 경우 - 사용자 프리미엄 결제 했으면, play 결제하지 않으면 일시정지 시켜라 코드를 작서했을 것이다.
        //백그라운드 들어갔을 때, 정보를 가리기 위해서 사진을 덮기도 한다.
        //여기까지 iOS 12에서 썼던 것 13부터 SceneDelegate로 갔다.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //유튜브에 화면이 있는데, 사용자가 백그라운드 상태를 뒀는지 알 수 없는데, 다시 액티브 상태로 돌아오면 팝업화면을 띄어달라고 쓰는 메소드이다.
        // 아하 생명주기에 관련된 함수들이 이런거구나. 죽어 있음. 실행을 안하고, 살아 있음 실행하는 것이구나.
        // kakaotalk - 카톡을 띄우면 비밀번호를 입력하는 화면을 덮어질 때가 있는데, 이때도 쓰는 것
        // 금융앱 - 백그라운드 있을 때 안보여주게 하는 기능들
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

