//
//  Observable.swift
//  TestMVVM
//
//  Created by Jooyoung Lee on 2022/11/04.
//

import Foundation

// 바인딩 역할을 해준다. 무엇을??????

class Observable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}
