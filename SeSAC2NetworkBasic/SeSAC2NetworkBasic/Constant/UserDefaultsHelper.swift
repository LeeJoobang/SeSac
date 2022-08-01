import Foundation

class UserDefaultsHelper { //Class 'UserDefaultsHelper' has no initializers  초기화를 처리하지 않아서
    private init() { }
    
    static let standard = UserDefaultsHelper() // 클래스 본인을 하나의 인스턴스로 생성해서 가져올 수 있다.
    //single ton 패턴 , 자기 자신의 인스턴스를 타입 프로퍼티 형태로 가지고 있음.
    //이것을 싱글톤 패턴이라고 한다. 한번 호출되면 계속 남아있다. 인스턴스 하나만 영구적으로 쓸 수 있게 만들어놓고, 필요로 할 때 쓰게 하고 하는거라.
    
    let userDefaults = UserDefaults.standard // 애플이 내부적으로 만들어 놓은 싱글톤 패턴이라고 볼 수 있다.
    
    enum Key: String {
        case nickname, age
    }
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장"
        }
        set {
            userDefaults.set(newValue, forKey: Key.nickname.rawValue)
        }
    }
    
    var age: Int {
        get {
            return userDefaults.integer(forKey: Key.age.rawValue) // int, double - default가 0이라서
        }
        set {
            userDefaults.set(newValue, forKey: Key.age.rawValue)
        }
    }
}
