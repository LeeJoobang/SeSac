import Foundation

class User<T> {
    
//    private var listener: (String, String) -> Void = { oldName, newName in
//
//        print("name changed: \(oldName) -> \(newName)")
//
//    }
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
//            print("name changed: \(oldValue) -> \(name)") // oldvalue는 didset에서만 제공해주는 값이다.
            listener?(value)// 매개변수로 oldvalue를 전달해줘야한다.
        }
    }
    
    init(_ value: T) { // 와일드카드로 외부매개변수 호출되지 않도록
        self.value = value
    }
    
    func bind(_ completionHandler: @escaping (T) -> Void) {
        completionHandler(value)
        listener = completionHandler
    }
    
}


