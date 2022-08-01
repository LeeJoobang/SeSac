import Foundation

//enum StoryboardName: String{
//    case Main
//    case Search
//    case Setting
//}

struct StoryboardName {
    // 접근 제어를 통해 초기화 방지
    private init() { // 이 키워드를 만들면 다른 파일 내에서 사용하지 못한다.
        
        
    }
    
    
    static let main = "Main"
    static let search = "Search"
    static let setting = "Setting"
}

/*
 1. enum 안에 타입 프로퍼티를 쓸 때의 장점
  - struct type property vs. enum type property  => instance 생성을 방지 할 수 있다? 열거형은 초기화가 안된다. 사용을 하고 싶다 하더라도, 스토리 보드에 사용할 때, 인스턴스 자체를 생성하지 못한다.
 2. enum cas vs, enum static => 중복 하지 못함.
 */

//enum StoryboardName { // 가장 적합한 형태이다.
//    // var nickname = "고래밥" - 오류발생: 왜? 인스턴스 생성이 불가해서.
//    static let main = "Main"
//    static let search = "Search"
//    static let setting = "Setting"
//}

//enum FontName: String {
//    case title = "SanFransisco"
//    case body = "SanFransisco" // 동일한 String 을 쓸 경우 Raw value for enum case is not unique , 오류가 발생한다. RawValue에 대해 unique하게 사용하지 못하게 된다.
//    case caption = "AppleSandol"
//}

enum FontName { // 해당 스트링에 대해 크게 오류가 발생하지 않는다!
    static let title = "SanFransisco"
    static let body = "SanFransisco"
    static let caption = "AppleSandol"
}
