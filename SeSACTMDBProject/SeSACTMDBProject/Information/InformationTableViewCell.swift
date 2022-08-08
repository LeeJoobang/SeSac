import UIKit

class InformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var infromationCellImageView: UIImageView!
    @IBOutlet weak var informationNameLabel: UILabel!
    @IBOutlet weak var informationSubnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
