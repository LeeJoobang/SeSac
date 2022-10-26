//
//  SubscribeViewController.swift
//  SeSACWeek1617
//
//  Created by Jooyoung Lee on 2022/10/26.
//

import UIKit
import RxSwift
import RxCocoa


class SubscribeViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

    //tap > 레이블: 안녕 반가워
        //방법 1
        button.rx.tap
            .withUnretained(self)
            .subscribe { (vc, _) in
                vc.label.text = "안녕반가워"
            }
            .disposed(by: disposeBag)

        //방법2. mainthread로 동작한다. - global로 변경하고자 할 수도 있음. thread 별 선택
        button.rx.tap
            .map {}
            .observe(on: MainScheduler.instance) // 다른쓰레드 사용이 가능하다.
            .withUnretained(self)
            .subscribe { (vc, _) in
                vc.label.text = "안녕반가워"
            }
            .disposed(by: disposeBag)

        //방법3 - bind는 무조건 main thread에서만, error x
        button.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.label.text = "안녕반가워"
            }
            .disposed(by: disposeBag)
        
        //방법 4 - operator로 데이터의 stream 조작
        button
            .rx
            .tap
            .map { "안녕 반가워" }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        //방법 5 - driver traits: bind + stream이 공유된다.(리로스 낭비 방지, share())
        button.rx.tap
            .map { "안녕 반가워" }
            .asDriver(onErrorJustReturn: "")
            .drive(label.rx.text)
            .disposed(by: disposeBag)
        
        
        
        
        
    }
    
    

  
}
