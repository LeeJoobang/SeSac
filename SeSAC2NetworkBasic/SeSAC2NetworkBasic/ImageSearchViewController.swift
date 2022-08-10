import UIKit


import Alamofire
import SwiftyJSON
import Kingfisher

class ImageSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageSearchCollectionView: UICollectionView!
    @IBOutlet weak var imageSearchBar: UISearchBar!
    
    var list: [URL] = []
    
    // 네트워크 요청시 시작 페이지 넘버
    var startPage: Int = 1
    var totalCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSearchCollectionView.delegate = self
        imageSearchCollectionView.dataSource = self
        imageSearchCollectionView.prefetchDataSource = self
        imageSearchBar.delegate = self
        
        layout()
    }
    
    
    func layout(){
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing
        imageSearchCollectionView.collectionViewLayout = layout
    }
    
    //fetch, requeset, callRequestImage, getImage  => response에 따라 네이밍을 설정해주기도 함
    // page 네이션을 해볼 것이다.
    
    func fetchImage(query: String){
        ImageSearchAPIManager.shared.fetchImageData(query: query, startPage: startPage) { totalCount, list in
            self.totalCount = totalCount
            self.list.append(contentsOf: list)
            
            DispatchQueue.main.async {
                self.imageSearchCollectionView.reloadData()
            }
        }
    }
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSearchViewCell", for: indexPath) as! ImageSearchViewCell
    cell.ImageSearchImageView.contentMode = .scaleToFill
    cell.ImageSearchImageView.kf.setImage(with: list[indexPath.row])
    return cell
}

// 페이지네이션 방법 1. 컬렉션 뷰가 특정 셀을 그리려는 시점에 호출되는 메서드.
// 마지막 셀의 사용자가 위치해 있는지 명확하게 확인하기 어려움.
// 굳이 필요없을 수도 있는데??? 주석처리
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        <#code#>
//    }

//페이지네이션 방법 2: UIScrollViewDelegateProtocol.
// 테이블뷰, 컬렉션뷰 스크롤뷰를 상속받고 있어서, 스크롤뷰 프로토콜을 사용할 수 있음.
// scrollview.offset.y = 체크해볼 수 있다.

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
//    }

}

extension ImageSearchViewController: UISearchBarDelegate {
    
    
    //검색 버튼 클릭시 실행. 검색 단어가 바뀔 수 있다.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            list.removeAll()
            startPage = 1
            //            imageSearchCollectionView.scrollToItem(at: <#T##IndexPath#>, at: <#T##UICollectionView.ScrollPosition#>, animated: <#T##Bool#>)
            fetchImage(query: text)
        }
    }
    
    //취소 버튼 눌렀을 때 실행
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        list.removeAll()
        imageSearchCollectionView.reloadData()
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    // 서치바에 커서가 깜빡이기 시작할 때 실행
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}

// 페이지네이션 방법 3. 용량이 큰 이미지 다운 받아 셀에 보여주려고 하는 경우에 효과적으로 사용할 수 있다.
// 셀이 화면에 보이기 전 필요한 리소스 다운 받을 수 있고, 필요하지 않다면 데이터를 취소할 수도 있음.
// iOS 10이상, 스크롤 성능 향상됨.

extension ImageSearchViewController: UICollectionViewDataSourcePrefetching {
    
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            if list.count - 1 == indexPath.item && list.count < totalCount {
                startPage += 30
                fetchImage(query: imageSearchBar.text!)
                
            }
        }
        print("===========\(indexPaths)==========")
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("====취소: \(indexPaths)")
    }
}
