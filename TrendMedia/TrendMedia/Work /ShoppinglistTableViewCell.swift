import UIKit

class ShoppinglistTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var shoppinglistLabel: UILabel!
    @IBOutlet weak var likeStarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         likeStarButton.setTitle("test", for: .normal)
        // uibutton의 텍스트 변환이 가능하다. 그러나 이미지를 넣으려고 했으나, 반영이 안됨. 이유 확인 필요
//        likeStarButton.setImage(UIImage(named: "star"), for: .normal)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func likeStarButtonReturn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    
    

}
