import UIKit

class BookSearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookBackgroundView: UIView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var bookCoverImageView: UIImageView!
    
    func configureInfo(data: Book){
        bookTitleLabel.text = data.title
        bookTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        classificationLabel.text = String(data.classification)
        classificationLabel.font = .boldSystemFont(ofSize: 12)
        
        bookCoverImageView.image = UIImage(named: data.cover)
        
        bookBackgroundView.backgroundColor = data.backgroundColor
        bookBackgroundView.layer.cornerRadius = 10

    }
    
}
