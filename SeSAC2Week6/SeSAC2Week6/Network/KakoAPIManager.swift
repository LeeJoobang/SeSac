import Foundation

import Alamofire
import SwiftyJSON

struct User {
    fileprivate let name = "고래밥" // 같은 스위프트 파일에서 다른 클래스, 구조체 사용 가능
    private let age = 11 // 같은 스위프트 파일 내에서 같은 타입
}

extension User {
    func example() {
        print(self.name, self.age)
    }
}

struct Person {
    
    func example() {
        let user = User()
        user.name
        //user.age // x - 'age' is inaccessible due to 'private' protection level
    }
}

class KakaoAPIManager {
    
    static let shared = KakaoAPIManager()
    
    private init() { }

    private let headers : HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakao)"]

    func callRequest(type: Endpoint, query: String, completionHandler: @escaping (JSON)->()) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = type.requestURL + query
        AF.request(url, method: .get, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")                
                completionHandler(json)
                
            case .failure(let error):
                print(error)
            }
        }

    }
    
}
