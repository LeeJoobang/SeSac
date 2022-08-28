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
    @objc func saveButtonClicked(sender: UIButton){

        let tasks = localRealm.objects(UserShopList.self)
        guard let name = detailView.shoppingName.text else { return }

        for task in tasks {
            if task.shopList == name {
                try! localRealm.write {
                    guard let image = detailView.shoppingImage.image else { return }
                    savaImageToDocument(filename: "\(task.objectID).jpg", image: image)
                    print("Realm is located at:", localRealm.configuration.fileURL!) //스니펫에 저장해서 써도 무방
                }
            }
        }
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
        print("fileURL: \(fileURL)")
    }

}


extension DetailViewController: SelectImageDelegate{
    func sendImageData(image: UIImage) {
        detailView.shoppingImage.image = image
    }
    
    
}
