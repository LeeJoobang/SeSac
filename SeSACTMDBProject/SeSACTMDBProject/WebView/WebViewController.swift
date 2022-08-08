import UIKit
import WebKit

import Alamofire
import SwiftyJSON

class WebViewController: UIViewController {
    
    @IBOutlet weak var tmdbVideoWeb: WKWebView!
    
    static var movieId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        requestVideo(movieID: WebViewController.movieId ?? "")

    }
    
    func requestVideo(movieID: String){
        let videourl = "\(EndPoint.tmdbCastURL)\(movieID)/videos?api_key=\(APIKey.APIKey)"
        AF.request(videourl, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                let key = json["results"][0]["key"].stringValue
                let youtubeURL = "\(EndPoint.tmdbYoutubeURL)\(key)"
                guard let url = URL(string: youtubeURL) else {
                    print("Invaild URL")
                    return
                }
                let request = URLRequest(url: url)
                self.tmdbVideoWeb.load(request)
            case .failure(let error):
                print(error)
            }
        }
    
    }
    
}
