//
//  ViewController.swift
//  SeSAC2NetworkBasic
//
//  Created by Joobang Lee on 2022/07/27.
//

import UIKit

class ViewController: UIViewController{
    
    static let identifier: String = "ViewController" // get을 굳이 쓰는 이유는 let으로 변경해줄 수 있기 때문이다. 구분에 대한 확인이 가능하다., 왜냐하면 get set 은 당연히 var가 되지 않겠는가?
    
//    var navigationTitleString: String = "대장님의 다마고치" {
//        get {
//            return "대장님의 다마고치"
//        }
//        set {
//            title = newValue
//        }
//    }
//
    var backgroundColor: UIColor {
        get{
            return .blue
        }
    } // 내가 get만 사용하고 싶으면 이처럼 let으로 변환시켜준다.
    
    func configureView() {
        
//        navigationTitleString = "고래밥님의 다마고치" // set을 활용했다.
////        backgroundColor = .red //어? get을 했는데, 왜 set이 가능하지???
//        
//        title = navigationTitleString
//        view.backgroundColor = backgroundColor
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

