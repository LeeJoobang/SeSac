import UIKit

import Alamofire
import SwiftyJSON

class BeerCollectionViewController: UICollectionViewController {
    
    var list: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        requestBeer()
        
    }
    
    func layout(){
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.4)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
    
    func requestBeer(){
        list.removeAll()
        
        let url = "https://api.punkapi.com/v2/beers"
        // AF: 200~299, Status Code: 301
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //                print("JSON: \(json)")
                for item in 0...json.arrayValue.count-1{
                    let beerName = json[item]["name"].stringValue
                    let image = json[item]["image_url"].stringValue
                    let description = json[item]["description"].stringValue
                    
                    let data = Beer(name: beerName, image: image, description: description)
                    self.list.append(data)
                }

                print(self.list)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as? BeerCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .orange

        cell.beerNameLabel.font = .boldSystemFont(ofSize: 15)
        cell.beerNameLabel.text = list[indexPath.row].name

        print(indexPath.row)
        return cell
    }
    
}

