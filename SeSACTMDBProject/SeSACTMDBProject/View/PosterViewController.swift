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
    
    var recommendMovieList: [[String]] = []
    var recommendTMDBList: [RecommendMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterTableView.delegate = self
        posterTableView.dataSource = self
        
        Refactoring.shared.researchTMDB { value in
            self.recommendTMDBList = value
            for _ in 0...self.recommendTMDBList.count{
                self.recommendMovieList.append([""])
            }
            self.posterTableView.reloadData()
           print("서버통신 완료")
            
            TMDBAPIManager.shared.requestImage { poster in
                self.recommendMovieList = poster
                self.posterTableView.reloadData()
//                dump(self.recommendMovieList)
                print("서버통신 완료 - 2번째")
            }
        }
    }
}

extension PosterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recommendTMDBList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.reusableIdentifier, for: indexPath) as? PosterTableViewCell else { return UITableViewCell()}
        
        cell.backgroundColor = .clear
        cell.contentCollectionView.backgroundColor = .clear
        cell.titleLabel.text = recommendTMDBList[indexPath.section].title
        
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        
        cell.contentCollectionView.tag = indexPath.section
        print("======\(indexPath.section)")
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
        //  빈배열 상태로 놔두지 말고 뭐라도 넣어두자.
        return recommendMovieList.count == 0 ? recommendMovieList.count : recommendMovieList[collectionView.tag].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.reusableIdentifier, for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
        
        let tmdbUrl = URL(string: "\(Refactoring.shared.imageURL)\(recommendTMDBList[indexPath.item].filePath)")
        let url = URL(string: "\(Refactoring.shared.imageURL)\(recommendMovieList[collectionView.tag][indexPath.item])")
        print("indexPath.item: \(indexPath.item)")
        print("collectionView.tag: \(collectionView.tag)")
        print("recommendMovieList[indexPath.item][collectionView.tag]: \(recommendMovieList[collectionView.tag][indexPath.item])")
        cell.posterView.posterLabel.text = ""
        cell.posterView.backgroundColor = .yellow
        cell.posterView.posterImageView.contentMode = .scaleToFill
        cell.posterView.posterImageView.kf.setImage(with: url)
        print("셀 생성 완료")
        return cell
    }
}
