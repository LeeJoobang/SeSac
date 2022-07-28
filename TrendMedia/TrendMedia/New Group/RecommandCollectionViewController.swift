import UIKit
import Toast
import Kingfisher

class RecommandCollectionViewController: UICollectionViewController {

    let imageViewLink = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bkEw&pkid=68&os=13908549&qvt=0&query=%EC%99%B8%EA%B3%84%2B%EC%9D%B8%201%EB%B6%80%20%ED%8F%AC%ED%86%A0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 화면이 보여지기 전에 셀 크기, 셀 사이 간격 등 설정
        // 컬렉션 뷰는 비율로 많이 잡기 때문이다.
        let layout = UICollectionViewFlowLayout() // 인스턴스 생성
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)//셀의 크기를 가지고 있다.
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = CGFloat(spacing)
        layout.minimumInteritemSpacing = spacing // 왜 미니멈을 넣을까? 최소한 여백은 보완해야한다. 여백을 근데 8로 했는데 왜 이렇게 차이가 크게 나오지? 셀 사이즈가 정해져 있기 대문이다. 비율이었다면 반영되었다.
        collectionView.collectionViewLayout = layout
        
        //composition layout
    }
    /*
     Table -> CollectionView
     Row -> Item
     heightFor
     
     기본설정
     numberOfItemInSection
     cellForItemAt
     
     */
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as! RecommandCollectionViewCell
        cell.recommandImageView.backgroundColor = .orange
        let url = URL(string: imageViewLink)
        cell.recommandImageView.kf.setImage(with: url)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item)번째 선택했습니다.", duration: 3.0, position: .top)
    }
}
