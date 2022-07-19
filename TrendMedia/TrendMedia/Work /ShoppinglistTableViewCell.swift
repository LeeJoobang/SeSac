import UIKit

class ShoppinglistTableViewCell: UITableViewCell {

    @IBOutlet weak var shoppingImageView: UIImageView!
    @IBOutlet weak var shoppinglistLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
