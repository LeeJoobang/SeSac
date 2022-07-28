//
//  WebViewViewController.swift
//  SeSAC2NetworkBasic
//
//  Created by Joobang Lee on 2022/07/28.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
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
}

extension WebViewViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
    }
}
