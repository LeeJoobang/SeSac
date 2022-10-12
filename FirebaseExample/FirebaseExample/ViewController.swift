//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Jooyoung Lee on 2022/10/05.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Analytics.logEvent("rejack", parameters: [
//          "name": "고래밥", // userdefault, realm
//          "full_text": "안녕하세요",
//        ])
//        
//        Analytics.setDefaultEventParameters([
//          "level_name": "Caverns01",
//          "level_difficulty": 4
//        ])
    }


    @IBAction func crashClicked(_ sender: UIButton) {
    }
    
    @IBAction func profileButtonClicked(_ sender: UIButton) { // present
        present(ProfileViewController(), animated: true)
    }
    
    @IBAction func settingButtonClicked(_ sender: UIButton) { // push
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
}


class ProfileViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}

class SettingViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}


extension UIViewController {
    
    var topViewController: UIViewController? {
        return self.topViewController(currentViewController: self)
    }
    
    // MARK: 최상위 뷰컨트롤러를 판단해주는 메서드 - snipet 저장(순서: tabbar, navigation, general)
    func topViewController(currentViewController: UIViewController) -> UIViewController{
        if let tabBarController = currentViewController as? UITabBarController, let selectedViewContoller = tabBarController.selectedViewController {
            return self.topViewController(currentViewController: selectedViewContoller)
        } else if let navigationController = currentViewController as? UINavigationController, let visibleViewController = navigationController.visibleViewController {
            return self.topViewController(currentViewController: visibleViewController)
        } else if let presentViewController = currentViewController.presentedViewController {
            return self.topViewController(currentViewController: presentViewController)
        } else {
            return currentViewController
        }
    }
    
    
}
