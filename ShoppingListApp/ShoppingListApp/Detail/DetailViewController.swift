import UIKit
import RealmSwift

protocol SelectImageDelegate {
    func sendImageData(image: UIImage)
}

class DetailViewController: BaseViewController {
    
    let detailView = DetailView()
    private let localRealm = try! Realm() 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        detailView.backgroundColor = .white
        detailView.searchImageButton.addTarget(self, action: #selector(selectImageButtonClicked), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
    }
    
    // realm + 이미지 도큐먼트 저장
    @objc func saveButtonClicked(){
        

        guard let name = detailView.shoppingName.text else { return }
        print(name)
        
        let task = UserShopList(shopList: name, shopImage: nil)
        
        do {
            try localRealm.write{
                localRealm.add(task)
            }
        } catch let error {
            print(error)
        }
        
        if let image = detailView.shoppingImage.image{
            savaImageToDocument(filename: "\(task.objectID).jpg", image: image)
        }
        
        dismiss(animated: true)
        
//        let task = UserDiary(diaryTitle: title, diaryContent: mainView.contentTextView.text!, diaryDate: Date(), regdate: Date(), photo: nil)
//
//        do {
//            try localRealm.write{
//                localRealm.add(task)
//            }
//        } catch let error {
//            print(error)
//        }
//
//        if let image = mainView.userImageView.image{
//            savaImageToDocument(filename: "\(task.objectID).jpg", image: image)
//        }
//
//        dismiss(animated: true)
    }

    

    @objc func selectImageButtonClicked(){
        let vc = SearchViewController()
        vc.delegate = self
        transition(vc, transitionStyle: .presentNavigation)
    }
    
    override func configureUI() {
    }
    
    override func setConstraints() {
    }
    
    func savaImageToDocument(filename: String, image: UIImage){
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentDirectory.appendingPathComponent(filename)
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        do {
            try data.write(to: fileURL)
        } catch let error{
            print("file save error", error)
        }
    }
    
    func loadImageFromDocument(filename: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentDirectory.appendingPathComponent(filename)
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        } else {
            return UIImage(systemName: "star.fill")
        }
    }
    
    
}


extension DetailViewController: SelectImageDelegate{
    func sendImageData(image: UIImage) {
        detailView.shoppingImage.image = image
    }
    
    
}
