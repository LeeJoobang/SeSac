import UIKit
class BookSearchCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout(){
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing
        layout.collectionView?.layer.cornerRadius = 10
    
        collectionView.collectionViewLayout = layout
        collectionView.layer.cornerRadius = 6.0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookSearchCollectionViewCell", for: indexPath) as! BookSearchCollectionViewCell
        cell.bookImageView.backgroundColor = .orange
        cell.layer.cornerRadius = 10

        return cell
    }
    
}
