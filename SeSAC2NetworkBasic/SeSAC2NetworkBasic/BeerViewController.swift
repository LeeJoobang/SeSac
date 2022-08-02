import UIKit

import Alamofire
import SwiftyJSON

class BeerViewController: UIViewController {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerInformationLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestBeer()
    }
    
    func requestBeer(){
        let url = "https://api.punkapi.com/v2/beers/random"
        // AF: 200~299, Status Code: 301
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let name = json[0]["name"].stringValue
                let description = json[0]["description"].stringValue
                let imageUrl = URL(string: json[0]["image_url"].stringValue)
                
                // image 변환
                DispatchQueue.global().async {
                    guard let imgeUrl = imageUrl else { return }
                    let data = try? Data(contentsOf: imgeUrl)
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.beerImageView.image = UIImage(data: data)
                    }
                }
                self.beerNameLabel.text = name
                
                self.beerInformationLabel.text = description
                self.beerInformationLabel.lineBreakMode = .byWordWrapping
                self.beerInformationLabel.numberOfLines = 0
                self.beerInformationLabel.sizeToFit()
                
                self.randomButton.setImage(UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"), for: .normal)
                self.randomButton.setTitle("", for: .normal)
                self.randomButton.tintColor = .lightGray
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        requestBeer()
    }
}
