import UIKit

import Kingfisher

class InformationViewController: UIViewController{
  
    @IBOutlet weak var informationPosterImageView: UIImageView!
    @IBOutlet weak var informationTableView: UITableView!
    
    static var informationData = [Movie]()
    static var informationNum = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "hi"
        self.view.backgroundColor = .green
        informationTableView.delegate = self
        informationTableView.dataSource = self

//        print("============\(InformationViewController.informationData[(InformationViewController.informationNum) - 1])=====")
        
        print("==========\(InformationViewController.informationNum)")
//        informationPosterImageView.kf.setImage(with: InformationViewController.informationData[InformationViewController.informationNum].backDrop)
//        tmdbImageView.kf.setImage(with: data[indexPath].poster)

    }
    
    
    
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

