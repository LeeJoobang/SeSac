import UIKit

import Alamofire
import SwiftyJSON
class PosterViewController: UIViewController {

    @IBOutlet weak var posterTableView: UITableView!
    let numberList: [[Int]] = [
        [Int](1...10),
        [Int](11...20),
        [Int](21...30),
        [Int](31...40),
        [Int](41...50),
        [Int](51...60),
        [Int](61...70),
        [Int](71...80),
        [Int](81...90),
        [Int](91...100)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterTableView.delegate = self
        posterTableView.dataSource = self
        
        researchTMDB()
        TMDBAPIManager.shared.callRequest()
    }
    
    func researchTMDB() {
        let url = "\(EndPoint.tmdbURL)\(APIKey.APIKey)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                for item in json["results"].arrayValue{
                    TMDBAPIManager.movieList.updateValue(item["title"].stringValue, forKey: item["id"].stringValue)
                }
                print(TMDBAPIManager.movieList)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PosterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.reusableIdentifier, for: indexPath) as? PosterTableViewCell else { return UITableViewCell()}
        cell.backgroundColor = .yellow
        cell.contentCollectionView.backgroundColor = .lightGray
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        cell.contentCollectionView.tag = indexPath.section
        
        cell.contentCollectionView.register(UINib(nibName: PosterCollectionViewCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: PosterCollectionViewCell.reusableIdentifier)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}

extension PosterViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberList[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.reusableIdentifier, for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
        cell.posterView.PosterLabel.text = "\(numberList[collectionView.tag][indexPath.row])"
        
        return cell
    }
}
