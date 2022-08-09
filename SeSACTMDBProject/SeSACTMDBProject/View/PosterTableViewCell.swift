import UIKit

class PosterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.text = "관련된 영화 목록"
        titleLabel.backgroundColor = .clear
        
        contentCollectionView.backgroundColor = .green
        contentCollectionView.collectionViewLayout = collectionLayout()
    }
    
    func collectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        
        return layout
    }
}
