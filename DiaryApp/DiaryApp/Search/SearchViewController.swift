import UIKit

class SearchViewController: BaseViewController{
    
    var searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView
        searchView.backgroundColor = .red
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        self.searchView.collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: SearchViewCell.reusableIdentifier)

        
        
    }
            
    override func configureUI() {
    }
    
    override func setConstraints() {
        
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewCell.reusableIdentifier, for: indexPath) as! SearchViewCell
        
        return cell
        
    }
    
    
}
