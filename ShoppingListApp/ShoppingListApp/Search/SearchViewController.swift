import UIKit

class SearchViewController: BaseViewController {
    
    var searchView = SearchView()
    var selectImage: UIImage?
    var delegate: SelectImageDelegate?
    var selectIndexPath: IndexPath?
    
    override func loadView() {
        self.view = searchView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func configureUI() {
        self.searchView.collectionView.delegate = self
        self.searchView.collectionView.dataSource = self
        self.searchView.collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: SearchViewCell.reusableIdentifier)
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem = closeButton
        
        let saveButton = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectedButtonClicked))
        navigationItem.rightBarButtonItem = saveButton
        
    }
    
    @objc func closeButtonClicked(){
        dismiss(animated: true)
    }
    
    @objc func selectedButtonClicked(){
        guard let selectImage = selectImage else {
            showAlertMessage(title: "사진을 선택해주세요.", button: "확인")
            return
        }
        delegate?.sendImageData(image: selectImage)

        dismiss(animated: true)
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageDummy.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewCell.reusableIdentifier, for: indexPath) as? SearchViewCell else { return UICollectionViewCell() }
        cell.setImage(data: ImageDummy.data[indexPath.item].url)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SearchViewCell else { return }
        selectImage = cell.searchImageView.image
        selectIndexPath = indexPath
        collectionView.reloadData()
    }
}
