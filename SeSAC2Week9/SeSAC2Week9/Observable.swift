import Foundation

class Observable<T> { // 양방향 바인딩
    
    private var listener: ((T) -> Void)?

    var value: T {
        didSet {
            print("didset", value)
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }

}

//class User {
//
//    Observable<Int>
//
//    private var listener: ((String) -> Void)?
//
//
//    var value: String {
//        didSet {
//            print("데이터 바뀌었어.")
//            //데이터가 바뀔 때 다양한 기능을 넣을 수 있다.
//            listener?(value) // didset 구문에 넣었기 때문에 데이터가 바뀔 때만 실행이 된다.
//        }
//    }
//
//    init(_ value: String) {
//        self.value = value
//    }
//}
