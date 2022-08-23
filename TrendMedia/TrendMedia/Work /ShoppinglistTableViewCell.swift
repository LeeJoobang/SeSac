import UIKit

class ShoppinglistTableViewCell: UITableViewCell {

    
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var shoppinglistLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        sender.isSelected ? checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .highlighted) : checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
    }
    
    @IBAction func likeStarButtonReturn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
//        sender.isSelected ? bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .selected) : bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
        
    }
    
    
    

}
