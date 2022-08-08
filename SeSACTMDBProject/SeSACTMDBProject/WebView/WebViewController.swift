import UIKit
import WebKit

import Alamofire
import SwiftyJSON

class WebViewController: UIViewController {

    @IBOutlet weak var tmdbWebView: WKWebView!
    
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var goForwardButton: UIBarButtonItem!
    
    static var movieId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBackButton.title = "뒤로"
        stopButton.title = "멈춰"
        reloadButton.title = "다시"
        goForwardButton.title = "앞으로"
        
        
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
                self.tmdbWebView.load(request)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func goBackButtonClicked(_ sender: UIBarButtonItem) {
        if tmdbWebView.canGoBack{
            tmdbWebView.goBack()
        }
    }
    
   
    @IBAction func stopButtonClicked(_ sender: UIBarButtonItem) {
        tmdbWebView.stopLoading()
    }
    
    
    @IBAction func reloadButtonClicked(_ sender: UIBarButtonItem) {
        tmdbWebView.reload()
    }
    
    
    @IBAction func goForwarButtonClicked(_ sender: UIBarButtonItem) {
        if tmdbWebView.canGoForward{
            tmdbWebView.goForward()
        }
    }
}
