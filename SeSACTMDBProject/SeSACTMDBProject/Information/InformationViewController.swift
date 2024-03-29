import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class InformationViewController: UIViewController{
    
    @IBOutlet weak var informationTableView: UITableView!
    @IBOutlet weak var backDropImageView: UIImageView!
    
    static var informationData = [Movie]()
    static var informationNum = Int()
    
    var castList: [CastInfo] = []
    
    var informationButtonActionHandler: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        self.navigationItem.title = "출연/정보"
        
//        backDropImageView.contentMode = .scaleToFill
//        backDropImageView.kf.setImage(with: informationData[informationNum].backDrop)
//
//
//        informationTableView.register(UINib(nibName: InformationTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: InformationTableViewCell.reuseIdentifier)
//
//        castRequest(movieID: informationData[informationNum].movieId)
        displayCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "설명", style: .plain, target: self, action: #selector(resetUserDefault))
    }
    
    func displayCell(){
//        informationButtonActionHandler?()
        
        backDropImageView.contentMode = .scaleToFill
        backDropImageView.kf.setImage(with: InformationViewController.informationData[InformationViewController.informationNum].backDrop)
        
        
        informationTableView.register(UINib(nibName: InformationTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: InformationTableViewCell.reuseIdentifier)
        
        castRequest(movieID: InformationViewController.informationData[InformationViewController.informationNum].movieId)
    }
    
    //        webVC.informationButtonActionHandler = {
    //            webVC.informationData = self.list
    //            webVC.informationNum = indexPath.row
    //        }
    
    
    @objc
    func resetUserDefault(){
        print("초기화면")
        showSesacAlert(title: "사용방법", message: "처음 접속시 사용방법을 확인하시겠습니까?", buttonTitle: "확인") { _ in
            UserDefaults.standard.removeObject(forKey: "First")
        }
    }
    
    
    private func castRequest(movieID: String){
        let casturl = "\(EndPoint.tmdbCastURL)\(movieID)/credits?api_key=\(APIKey.APIKey)"
        AF.request(casturl, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                //name, profile_path, character
                for cast in json["cast"].arrayValue{
                    let name = cast["name"].stringValue
                    let charcter = cast["character"].stringValue
                    let image = cast["profile_path"].stringValue
                    let imagePath = "\(APIKey.imageURL)\(image)"
                    guard let imageUrl = URL(string: imagePath) else { return }
                    let data = CastInfo(name: name, image: imageUrl, character: charcter)
                    self.castList.append(data)
                }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.reuseIdentifier, for: indexPath) as! InformationTableViewCell
        print(castList.count)
        cell.infromationCellImageView.kf.setImage(with: castList[indexPath.row].image)
        cell.infromationCellImageView.contentMode = .scaleAspectFit
        cell.informationNameLabel.text = castList[indexPath.row].name
        cell.informationSubnameLabel.text = castList[indexPath.row].character
        return cell
        
    }
    
    
}

