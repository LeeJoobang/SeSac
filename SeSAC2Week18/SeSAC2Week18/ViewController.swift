//
//  ViewController.swift
//  SeSAC2Week18
//
//  Created by Jooyoung Lee on 2022/11/02.
//

import UIKit
import RxSwift

// Index out of range...런타임 오류는 못참지

class ViewController: UIViewController { // 프로필 뷰라고 가정을 해보자.

    @IBOutlet weak var label: UILabel!
    let viewModel = ProfileViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phone = Phone()
        print(phone[2])
        print(phone.numbers[2])

        viewModel.profile // <single>, syntax sugar
            .withUnretained(self)
            .subscribe { (vc, value) in
                
                vc.label.text = value.user.email
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        //subscribe, bind, drive
        // driver vs. signal
        
        
        viewModel.getProfile()
        checkCOW()
    }
    
    //값 타입 참조 타입 8회차
    func checkCOW() {
        var test = "jack"
        address(&test) // inout 매개변수
        
        print(test[2])
        print(test[100])
        
        var test2 = test
        address(&test2)
        
        test2 = "sesac"
        address(&test)
        address(&test2)
        
        print("==============")
        var array = Array(repeating: "A", count: 100) // array, dictionary, set == collection
        address(&array)
        print(array[safe: 99]) // out of range 대응
        print(array[safe: 199])
        
        var newArrary = array // 실제로 복사를 안함, 원본은 공유하고 있음.
        address(&newArrary)
        
        newArrary[0] = "B"
        
        address(&array)
        address(&newArrary)

    }
    
    func address(_ value: UnsafeRawPointer){
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }


}

