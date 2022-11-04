//
//  Observable.swift
//  TestMVVM
//
//  Created by Jooyoung Lee on 2022/11/04.
//

import Foundation

// 바인딩 역할을 해준다. 무엇을??????

class Observable<T> {
    private var listener: ((T) -> Void)?
    // ✅ 값이 변할 때마다 클로저 listener 를 호출한다.(View 의 액션에 따라서 자동으로 View Model 의 값이 최신화.)
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void){
        closure(value)
        listener = closure
    }
    
}
