import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class InformationViewController: UIViewController{
    
    
    @IBOutlet weak var informationTableView: UITableView!
    @IBOutlet weak var backDropImageView: UIImageView!
    
    var informationData = [Movie]()
    var informationNum = Int()
    
    var castList: [CastInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        self.navigationItem.title = "hi"
        self.view.backgroundColor = .green
        informationTableView.backgroundColor = .green
        
        backDropImageView.contentMode = .scaleToFill
        backDropImageView.kf.setImage(with: informationData[informationNum].backDrop)
        
        informationTableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: InformationTableViewCell.reuseidentifier)
        
        castRequest(movieID: informationData[informationNum].movieId)
    }
    
    func castRequest(movieID: String){
        let casturl = "\(EndPoint.tmdbCastURL)\(movieID)/credits?api_key=\(APIKey.APIKey)"
        AF.request(casturl, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                //name, profile_path, character
                for cast in json["cast"].arrayValue{
                    print(cast)
                    let name = cast["name"].stringValue
                    let charcter = cast["character"].stringValue
                    let image = cast["profile_path"].stringValue
                    let imagePath = "\(APIKey.imageURL)\(image)"
                    guard let imageUrl = URL(string: imagePath) else { return }
                    let data = CastInfo(name: name, image: imageUrl, character: charcter)
                    self.castList.append(data)

                }
                print(self.castList)
                
                self.informationTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
    
    
    
    extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return castList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            print(castList.count)
            cell.infromationCellImageView.kf.setImage(with: castList[indexPath.row].image)
            cell.infromationCellImageView.contentMode = .scaleAspectFit
            cell.informationNameLabel.text = castList[indexPath.row].name
            cell.informationSubnameLabel.text = castList[indexPath.row].character
            return cell
            
        }
        
        
    }
    
