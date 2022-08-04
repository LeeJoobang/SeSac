import UIKit


import Alamofire
import SwiftyJSON
import Kingfisher

class ImageSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageSearchCollectionView: UICollectionView!
    
    var list: [URL] = []
//    var list: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSearchCollectionView.delegate = self
        imageSearchCollectionView.dataSource = self
        
        layout()
        fetchImage()
    }
    
    
    func layout(){

        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing
        imageSearchCollectionView.collectionViewLayout = layout
    }
    
    //fetch, requeset, callRequestImage, getImage  => response에 따라 네이밍을 설정해주기도 함
    // page 네이션을 해볼 것이다.
    
    func fetchImage(){
        
        let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageSearchURL + "query=\(text)&diplay=30&start=31"
        print(url)
        // AF: 200~299, Status Code: 301
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                // Dispatch group
                for snack in json["items"].arrayValue{
                    let imageUrl = snack["link"].stringValue
                    print(imageUrl)
                    let url = URL(string: imageUrl)
                    guard let url = url else { return }
//                    let data = Data(imageUrl.utf8)
                    print(imageUrl)
                    self.list.append(url)
//                    self.list.append(data)

                }
                self.imageSearchCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSearchViewCell", for: indexPath) as! ImageSearchViewCell
        cell.ImageSearchImageView.contentMode = .scaleToFill
//        cell.ImageSearchImageView.image = UIImage(data: list[indexPath.row])
        cell.ImageSearchImageView.kf.setImage(with: list[indexPath.row])
        return cell
    }
    
}
