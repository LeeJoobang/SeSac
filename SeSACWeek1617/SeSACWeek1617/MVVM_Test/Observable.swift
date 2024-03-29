////
////  Sample.swift
////  SeSACWeek1617
////
////  Created by Jooyoung Lee on 2022/10/30.
////
//
//import Foundation
//
//class Observable<T> {
//    private var listener: ((T) -> Void)?
//    var value: T {
//        didSet {
//            listener?(value)
//        }
//    }
//    init(_ value: T) {
//        self.value = value
//    }
//    func bind(_ closure: @escaping (T) -> Void) {
//        closure(value)
//        listener = closure
//    }
//}
