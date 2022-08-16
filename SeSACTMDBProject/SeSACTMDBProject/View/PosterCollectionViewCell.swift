import UIKit

class PosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterView: PosterView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI(){
        posterView.backgroundColor = .clear
        posterView.posterImageView.backgroundColor = .clear
        posterView.posterImageView.layer.cornerRadius = 10
    }
}
