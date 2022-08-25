import UIKit
import RealmSwift

protocol SelectImageDelegate {
    func sendImageData(image: UIImage)
}

class DetailViewController: BaseViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        detailView.backgroundColor = .white
        detailView.searchImageButton.addTarget(self, action: #selector(selectImageButtonClicked), for: .touchUpInside)

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
