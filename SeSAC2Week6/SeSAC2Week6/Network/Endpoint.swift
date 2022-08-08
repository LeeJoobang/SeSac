import Foundation

enum Endpoint {
    
    case blog
    case cafe
    // 저장 프로퍼티를 못쓰는 이유가 있다. 왜?
    // 초기화 구문을 생성할 수 있을 때, 생성할 수 있는데 연산프로퍼티는 왜 사용이 가능할까?
    // 메서드처럼 사용이 가능하기 때문에
    var requestURL: String { // 연산프로퍼티이다.
        switch self {
        case .blog:
            return URL.makeEndPointString("blog?query=")
        case .cafe:
            return URL.makeEndPointString("cafe?query=")
        }
    }
    
}
