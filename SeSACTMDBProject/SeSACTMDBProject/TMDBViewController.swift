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
                    let overview = movie["overview"].stringValue
                    let title = movie["title"].stringValue
                    let average = movie["vote_average"].stringValue
                    
                    guard let url = URL(string: poster) else { return }
                    
                    let data = Movie(poster: url, overview: overview, title: title, average: average)
                    self.list.append(data)
                }
                self.tmdbTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "헤더"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tmdbTableView.dequeueReusableCell(withIdentifier: "TMDBTableViewCell", for: indexPath) as! TMDBTableViewCell
        cell.configureCell(data: list, indexPath: indexPath.row)
       // cell.tmdbImageView.kf.setImage(with: list[indexPath.row].poster)
        return cell
    }
    
    
}
