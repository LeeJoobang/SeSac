import UIKit
import SnapKit

class SearchView: BaseView{
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "원하는 이미지 이름을 입력해주세요."
        return search
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [searchBar, collectionView].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.searchBar.snp.bottom)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}

