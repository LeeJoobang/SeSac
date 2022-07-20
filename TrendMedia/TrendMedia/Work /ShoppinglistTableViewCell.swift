import UIKit

class ShoppinglistTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var shoppinglistLabel: UILabel!
    @IBOutlet weak var likeStarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         likeStarButton.setTitle("test", for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func likeStarButtonReturn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    
    

}
