import UIKit

class PosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterView: PosterView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        posterView.backgroundColor = .clear
        posterView.PosterLabel.backgroundColor = .blue
    }
}
