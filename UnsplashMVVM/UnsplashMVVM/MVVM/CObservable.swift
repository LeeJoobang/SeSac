//
//  CObservable.swift
//  UnsplashMVVM
//
//  Created by Jooyoung Lee on 2022/10/29.
//

import Foundation

final class CObservable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
    
}
