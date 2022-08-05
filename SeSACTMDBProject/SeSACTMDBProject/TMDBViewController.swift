import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class TMDBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tmdbTableView: UITableView!
    
    var list = [Movie]()
    
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
    
    func researchTMDB() {
        self.list.removeAll()
        let url = "\(EndPoint.tmdbURL)\(APIKey.APIKey)"
        
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
                    let backDrop = movie["backdrop_path"].stringValue
                    let backDropPath = "\(APIKey.imageURL)\(backDrop)"
                    guard let posterUrl = URL(string: posterPath) else { return }
                    guard let backDropUrl = URL(string: backDropPath) else { return }
                    
                    let data = Movie(poster: posterUrl, overview: overview, title: title, average: String(voteAverage), releaseDate: releaseDate, backDrop: backDropUrl)
                    self.list.append(data)
                }
                self.tmdbTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tmdbTableView.dequeueReusableCell(withIdentifier: "TMDBTableViewCell", for: indexPath) as! TMDBTableViewCell
        cell.tmdbImageView.contentMode = .scaleToFill
        cell.configureCell(data: list, indexPath: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Information", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
        vc.informationData = list
        vc.informationNum = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    @IBAction func informationButtonClicked(_ sender: UIButton) {
//        let sb = UIStoryboard(name: "Information", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
}
