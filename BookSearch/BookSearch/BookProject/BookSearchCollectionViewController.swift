import UIKit
class BookSearchCollectionViewController: UICollectionViewController {
    
    var bookList = BookInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationItem.title = "Book Infomation"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchBookInfomation))
    }
    
    @objc
    func backButtonClicked(){
        self.dismiss(animated: true)
        
    }
    
    @objc
    func searchBookInfomation(_ sender: UIButton){
        print(sender)
        let storyboard = UIStoryboard(name: "SearchBookInformation", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchBookInformationViewController") as! SearchBookInformationViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
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
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookSearchCollectionViewCell", for: indexPath) as! BookSearchCollectionViewCell
        let data = bookList.book[indexPath.row]
        cell.configureInfo(data: data)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "BookDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
