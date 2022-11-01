//
//  ValidationViewModel.swift
//  SeSACWeek1617
//
//  Created by Jooyoung Lee on 2022/10/27.
//

import Foundation
import RxCocoa
import RxSwift

class ValidationViewModel {
    let validText = BehaviorRelay(value: "닉네임 최소 8자 이상 필요해요.")
    struct Input {
        let text: ControlProperty<String?> // nametextfield.rx.text
        let tap: ControlEvent<Void> // stepButton.rx.tap
        
    }
    
    struct Output {
        let validation: Observable<Bool>
        let tap: ControlEvent<Void>
        let text: Driver<String>
        
    }
    
    func transform(input: Input) -> Output{
        let valid = input.text // vc = let validation을 의미함
            .orEmpty
            .map { $0.count >= 8 }
            .share()
        
        let text = validText.asDriver()
        
        return Output(validation: valid, tap: input.tap, text: text)
        
        
    }
}
