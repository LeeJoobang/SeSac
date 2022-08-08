import Foundation

import Alamofire
import SwiftyJSON

class KakaoAPIManager {
    
    static let shared = KakaoAPIManager()
    
    private init() { }

    let headers : HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakao)"]

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
