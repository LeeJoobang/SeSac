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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewController ViewWillAppear")
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewController ViewWillAppear")
    }
    
}

class SettingViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewController ViewWillAppear")
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


extension UIViewController{
    // MARK: class or static 사용 가능 - overriding 진행
    // MARK: log찍을 때도 유용
    class func swizzleMethod(){
        let origin = #selector(viewWillAppear)
        let change = #selector(changeViewWillAppear)
        
        guard let originMethod = class_getInstanceMethod(UIViewController.self, origin), let changeMethod = class_getInstanceMethod(UIViewController.self, change) else {
            print("함수를 찾을 수 없거나 오류 발생")
            return
        }
        method_exchangeImplementations(originMethod, changeMethod)
                
    }
    
    @objc func changeViewWillAppear(){
        print("Change ViewWillAppear SUCCEED")
    }
}
