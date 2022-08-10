import UIKit

import Kingfisher

/*
 awakeFromNIB - 셀 ui초기화, 재사용 매커니즘에 의해 일정횟수 이상 호출되지 않음
 
 cellForItemAt
    - 재사용될 때마다 호출된다.
    - 화면과 데이터는 별개, 모든 인덱스패스.아이템에 대한 조건이 없다면 재사용시 오류 발생가능
 
 prepareForReuse
    - 셀이 재사용될 때, 초기화 하고자 하는 값을 넣으면 오류를 해결할 수 있음. 즉 , cellForRowAt에서 모든 indexPath.item에 대한 조건을 작성하지 않아도 된다.
 
 CollectionView in TableView
    - 하나의 컬렉션 뷰나 테이블 뷰라면 문제 x
    - 복합적인 구조라면, 테이블 뷰도 재사용이 되어야 하고, 컬렉션 뷰도 재사용이 되어야 한다.
    - cell.contentCollectionView.reloadData() // index out of range 오류를 해결할 수 있다.
    -  index > reloadData

    - print, debugger로 확인할 수 있음.
 
 api
 https://developers.themoviedb.org/3/tv-seasons/get-tv-season-details
 */

class MainViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    
    let color: [UIColor] = [.green, .blue, .lightGray, .yellow, .black]

    let numberList: [[Int]] = [
        [Int](100...110),
        [Int](55...75),
        [Int](5000...5006),
        [Int](51...60),
        [Int](61...70),
        [Int](71...80),
        [Int](81...90)
    ]
    
    var episodeList: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        bannerCollectionView.register(UINib(nibName: CardCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
        bannerCollectionView.collectionViewLayout = collectionViewLayout()
        bannerCollectionView.isPagingEnabled = true //device width
        
        
        TMDBAPIManager.shared.requestImage { value in
            dump(value)
            // 1. 네트워크 통신 2. 배열 생성 3. 배열 담기
            // 4. 뷰 등에 표현(ex. 테이블뷰 섹션, 컬렉션 뷰 셀 )
            // 5. 테이블뷰 갱신
            self.episodeList = value
            self.mainTableView.reloadData()
        }
        // 넷플릭스 인기컨텐츠 레이블 > 드라마 타이틀로 바꾸기(완료)
        // 테이블뷰 셀 높이나 컬렉션 뷰 셀 사이즈 수정
        
        
    }
}

// 하나의 프로토콜, 메서드에서 여러 컬렉션 뷰의 delegate, datasource를 구현해야 함.

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodeList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //내부 매개변수 tableView를 통해 테이블뷰를 특정
    //테이블 뷰 객체 하나일 경우에는 내부 매개변수를 활용하지 않아도 문제가 생기지 않는다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .yellow
        cell.titleLabel.text = TMDBAPIManager.shared.tvList[indexPath.section].0
        cell.contentCollectionView.backgroundColor = .lightGray
        
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        
        cell.contentCollectionView.tag = indexPath.section // 각 셀 구분 짓기, UIView Tag
        cell.contentCollectionView.register(UINib(nibName: CardCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
        cell.contentCollectionView.reloadData() // cell 재사용시 발생하는 오류에 대해 테이블뷰 자체를 reload 해줌으로써 확인할 수 있음.
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240 // 테이블뷰 셀 사이즈 변경
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == bannerCollectionView ? color.count : episodeList[collectionView.tag].count
    }
    
    //내부 매개변수에 bannerCollectionView or CollectionView in TableView
    //내부 매개변수가 아닌 명확한 아웃렛을 사용할 경우, 셀이 재사용되면 특정 collectionView 셀을 재사용하게 될 수 있음.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("MainViewController", #function, indexPath)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseIdentifier, for: indexPath) as?
                CardCollectionViewCell else { return UICollectionViewCell()}
        
        if collectionView == bannerCollectionView {
            cell.cardView.posterImageView.backgroundColor = color[indexPath.item]
        } else {
//            cell.cardView.posterImageView.backgroundColor = collectionView.tag.isMultiple(of: 2) ? .brown : .black // collectionView의 tag 활용
            cell.cardView.backgroundColor = .blue
            cell.cardView.posterImageView.backgroundColor = .black
            cell.cardView.contentLabel.textColor = .white
            
            let url = URL(string: "\(TMDBAPIManager.shared.imageURL)\(episodeList[collectionView.tag][indexPath.item])")
            cell.cardView.posterImageView.kf.setImage(with: url)
            
            cell.cardView.contentLabel.text = ""
// 화면과 데이터는 별개, 모든 indexPath.item에 대한 조건이 없다면 재사용시 오류가 발생할 수 잇음.
//            if indexPath.item < 2 {
//                cell.cardView.contentLabel.text = "\(numberList[collectionView.tag][indexPath.row])"
//            }
//            else {
//                cell.cardView.contentLabel.text = "해피"
//            }
        }
        
        
        return cell
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: bannerCollectionView.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
}
