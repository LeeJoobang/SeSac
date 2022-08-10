import Foundation

import Alamofire
import SwiftyJSON

//클래스 싱글턴 패턴 vs 구조체 싱글턴 패턴 - 왜 안좋을까???
class ImageSearchAPIManager {
    
    static let shared = ImageSearchAPIManager()
    
    private init() { }
    
    typealias completionHandler = (Int, [String]) -> Void
    
    func fetchImageData(query: String, startPage: Int, completionHandelr: @escaping (Int, [String]) -> Void) {
        
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = "https://openapi.naver.com/v1/search/image.json?query=\(text)&display=30&start=\(startPage)"
        
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseData(queue: .global()) { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let totalCount = json["total"].intValue
                // Dispatch group
                
                for snack in json["items"].arrayValue{
                    let imageUrl = snack["link"].stringValue
                    let url = URL(string: imageUrl)
                    guard let url = url else { return }
                    self.list.append(url)
                }
                
                completionHandelr(totalCount, list)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
