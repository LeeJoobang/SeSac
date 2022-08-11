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
    
    var recommendMovieList: [[String]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterTableView.delegate = self
        posterTableView.dataSource = self
                
        TMDBAPIManager.shared.requestImage { posterList in
            self.recommendMovieList = posterList
            self.posterTableView.reloadData()
            dump(posterList)

        }
        
    }
    

}

extension PosterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(recommendMovieList.count)
        return recommendMovieList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.reusableIdentifier, for: indexPath) as? PosterTableViewCell else { return UITableViewCell()}
        cell.backgroundColor = .yellow
        cell.contentCollectionView.backgroundColor = .lightGray
        cell.titleLabel.text = TMDBAPIManager.shared.movieList[indexPath.section].0
        
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        
        cell.contentCollectionView.tag = indexPath.section
        cell.contentCollectionView.register(UINib(nibName: PosterCollectionViewCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: PosterCollectionViewCell.reusableIdentifier)
        cell.contentCollectionView.reloadData()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

extension PosterViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(recommendMovieList[collectionView.tag].count)
        return recommendMovieList[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.reusableIdentifier, for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
        
        let url = URL(string: "\(TMDBAPIManager.shared.imageURL)\(recommendMovieList[collectionView.tag][indexPath.item])")
//        print(recommendMovieList[collectionView.tag])
        cell.posterView.posterImageView.kf.setImage(with: url)
        return cell
    }
}
