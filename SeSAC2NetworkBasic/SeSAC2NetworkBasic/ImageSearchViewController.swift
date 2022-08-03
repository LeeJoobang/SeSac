import UIKit


import Alamofire
import SwiftyJSON

class ImageSearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    //fetch, requeset, callRequestImage, getImage  => response에 따라 네이밍을 설정해주기도 함
      // page 네이션을 해볼 것이다.

    func fetchImage(){
        
        let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageSearchURL + "query=\(text)&diplay=30&start=31"
        // AF: 200~299, Status Code: 301
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
