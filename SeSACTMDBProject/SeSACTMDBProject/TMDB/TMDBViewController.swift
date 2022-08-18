import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class TMDBViewController: UIViewController {
   
    @IBOutlet weak var tmdbTableView: UITableView!
    

    var list = [Movie]()
    var movieChangePage = 1 // 데이터가 10개만 나오기 때문에 우선적으로 페이지 네이션 패스
    var totalPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.navigationItem.title = "TMDB"

        tmdbTableView.delegate = self
        tmdbTableView.dataSource = self

        researchTMDB()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tmdbTableView.reloadData()
    }
    
    private func researchTMDB() {
        self.list.removeAll()
        let url = "\(APIKey.URL)\(APIKey.APIKey)"

        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                for movie in json["results"].arrayValue{
                    let poster = movie["poster_path"].stringValue
                    let posterPath = "\(APIKey.imageURL)\(poster)"
                    let overview = movie["overview"].stringValue
                    let title = movie["title"].stringValue
                    let average = movie["vote_average"].stringValue
                    let voteAverage = average.prefix(3)
                    let releaseDate = movie["release_date"].stringValue
                    let id = movie["id"].stringValue
                    let backDrop = movie["backdrop_path"].stringValue
                    let backDropPath = "\(APIKey.imageURL)\(backDrop)"
                    guard let posterUrl = URL(string: posterPath) else { return }
                    guard let backDropUrl = URL(string: backDropPath) else { return }
                    
                    let data = Movie(poster: posterUrl, overview: overview, title: title, average: String(voteAverage), releaseDate: releaseDate, backDrop: backDropUrl, movieId: id)
                    
                    self.list.append(data)
                }
                self.tmdbTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TMDBViewController: UITableViewDelegate, UITableViewDataSource {
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tmdbTableView.dequeueReusableCell(withIdentifier: TMDBTableViewCell.reuseIdentifier, for: indexPath) as! TMDBTableViewCell
        cell.tmdbImageView.contentMode = .scaleToFill
        cell.configureCell(data: list, indexPath: indexPath.item)
        cell.tmdbVideoButton.tag = indexPath.row
//        cell.tmdbVideoButton.addTarget(self, action: #selector(videoButtonClicked), for: .touchUpInside)
        
        cell.tmdbVideoButton.addTarget(self, action: #selector(videoButtonClicked), for: .touchUpInside)
        return cell
    }
    

    
    
    @objc
    func videoButtonClicked(_ sender: UIButton) {
        WebViewController.movieId = list[sender.tag].movieId
        transitionViewController(storyboard: "WebView", identifier: WebViewController.reuseIdentifier, viewController: WebViewController())
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // alert삭제

        InformationViewController.informationData = self.list
        InformationViewController.informationNum = indexPath.row
        
        transitionViewController(storyboard: "Information", identifier: InformationViewController.reuseIdentifier, viewController: InformationViewController())
        
//        let infoVC = InformationViewController()
//        infoVC.informationButtonActionHandler = {
//            infoVC.informationData = self.list
//            infoVC.informationNum = indexPath.row
//        }
//        showSesacAlert(title: list[indexPath.row].title, message: "\(list[indexPath.row].title)의 등장인물 정보를 보시겠습니까?", buttonTitle: "확인")
    }
}
