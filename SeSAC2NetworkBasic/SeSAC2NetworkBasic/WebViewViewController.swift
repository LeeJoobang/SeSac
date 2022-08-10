import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
   // static var reuseIdentifier: String = String(describing: WebViewViewController.self) //"WebViewController"로 표현

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var goForwardButton: UIBarButtonItem!
    
    var destinationURL: String = "https://www.apple.com"
    //http 대부분 차단한다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openWebPage(url: destinationURL)
        searchBar.delegate = self
        }
        
        func openWebPage(url: String){
            guard let url = URL(string: url) else {
                print("Invaild URL")
                return
            }
            
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func goBackButtonClicked(_ sender: UIBarButtonItem) {
        self.webView.goBack()
    }
   
    @IBAction func reloadButtonClicked(_ sender: UIBarButtonItem) {
        self.webView.reload()
    }
    
    @IBAction func goForwardButtonClicked(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            self.webView.goForward()
        }
    }
}

extension WebViewViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
    }
}
