import UIKit

class UnsplashCollectionViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var unsplashViewModel = UnsplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
