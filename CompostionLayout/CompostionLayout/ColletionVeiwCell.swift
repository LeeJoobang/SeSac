import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static var id = String(describing: CollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
