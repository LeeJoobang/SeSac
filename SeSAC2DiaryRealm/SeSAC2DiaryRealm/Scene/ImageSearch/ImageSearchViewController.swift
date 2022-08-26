import UIKit
import Kingfisher

class SearchImageViewController: BaseViewController {

    var delegate: SelectImageDelegate?
    var selectImage: UIImage?
    var selectIndexPath: IndexPath?
    
    var name: String?
    
    let mainView = ImageSearchView()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.BaseColor.background
    }

    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(ImageSearchCollectionViewCell.self, forCellWithReuseIdentifier: ImageSearchCollectionViewCell.reuseIdentifier)
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem = closeButton
        
        let saveButton = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectedButtonClicked))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func closeButtonClicked(){
        dismiss(animated: true)
    }
    
    @objc func selectedButtonClicked(){ // 옵셔널 타입이기 때문에 옵셔널 해제
        
        guard let selectImage = selectImage else {//선택할 때 alert을 띄워주는 것이 좋다.
            showAlertMessage(title: "사진을 선택해주세요.", button: "확인") // alert대신 toast가 더 적합할 수 있다.
            return
        }

        delegate?.sendImageData(image: selectImage)
        dismiss(animated: true)
    }
}
 
extension SearchImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageDummy.data.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSearchCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageSearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.layer.borderWidth = selectIndexPath == indexPath ? 4 : 0
        cell.layer.borderColor = selectIndexPath == indexPath ? Constants.BaseColor.point.cgColor : nil

        cell.setImage(data: ImageDummy.data[indexPath.item].url)

        return cell
    }
    
    // userinteracionenableed & progress loading / stop
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 어떤 셀인지, 어떤 이미지를 가지고 올지, 어떻게 알죠?
//        ImageDummy.data[indexPath.item].url // ?? uiimage
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageSearchCollectionViewCell else { return }
        selectImage = cell.searchImageView.image
        
        selectIndexPath = indexPath
        collectionView.reloadData()
        
    }
    
    // 과제가 늘었다 왜 안되니?
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(#function)
        selectIndexPath = nil
        selectImage = nil
        collectionView.reloadData()
    }

}
