import UIKit

import Kingfisher

class InformationViewController: UIViewController{
    
    
    @IBOutlet weak var informationTableView: UITableView!
    
    @IBOutlet weak var backDropImageView: UIImageView!
    
    var informationData = [Movie]()
    var informationNum = Int()
    
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
    }
    
}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
        cell.informationNameLabel.text = "test1\(indexPath.row)"
        cell.informationSubnameLabel.text = " test1\(indexPath.row)"
        return cell
        
    }
    
    
}

