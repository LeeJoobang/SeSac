import UIKit

struct User: Hashable {
    
    static func == (lhs: User, rhs: User) -> Bool{
        lhs.id == rhs.id
    }
    let id = UUID().uuidString
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

//private let reuseIdentifier = "Cell"

class SimpleCollectionViewController: UICollectionViewController {
    
//    let list = ["닭곰탕", "삼계탕", "들기름김", "삼분카레", "콘소메치킨"]
    
    var list = [
        User(name: "뽀로로", age: 3),
        User(name: "뽀로로", age: 3),
        User(name: "해리포터", age: 32),
        User(name: "도라에몽", age: 5),
    ]
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>! // 왜바깥? cellforrowat 이 시행되기 전에 미리 생성해달라고 문서에서 언급함. 시점의 불일치, 기존 register 코드와 유사함
    
    var dataSource: UICollectionViewDiffableDataSource<Int, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // MARK: 14+ 컬렉션 뷰를 테이블뷰 스타일처럼 사용가능(List Configuration)
//        // MARK: 컬렉션 뷰 스타일(컬렉션 뷰 셀 x)
//        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        configuration.showsSeparators = false // 구분선 옵션
//        configuration.backgroundColor = .red // 백그라운드 컬러
//
//        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        collectionView.collectionViewLayout = createLayout()
    
        // 1. identifier, 2. Struct
        cellRegistration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .blue // text color change
            
            content.secondaryText = "\(itemIdentifier.age)살"
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 20
            
//            content.image = indexPath.item < 3 ? UIImage(systemName: "person.fill") : UIImage(systemName: "star")
            content.image = itemIdentifier.age < 8 ? UIImage(systemName: "person.fill") : UIImage(systemName: "star")
            if indexPath.item < 3{
                content.imageProperties.tintColor = .yellow
            }
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemPink
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration,  for: indexPath, item: itemIdentifier)
            return cell
            
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, User>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
        
    }
    
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        // MARK: cellRegistration
////       https://developer.apple.com/documentation/uikit/uicollectionview/cellregistration/
//        let item = list[indexPath.item]
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration,  for: indexPath, item: item)
//        return cell
//
//    }

}
extension SimpleCollectionViewController{
    private func createLayout() -> UICollectionViewLayout{
        // MARK: 14+ 컬렉션 뷰를 테이블뷰 스타일처럼 사용가능(List Configuration)
        // MARK: 컬렉션 뷰 스타일(컬렉션 뷰 셀 x)
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false // 구분선 옵션
        configuration.backgroundColor = .red // 백그라운드 컬러
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout

    }
}
