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
        
        
//        guard let title = mainView.titleTextField.text else {
//            showAlertMessage(title: "제목을 입력해주세요.", button: "확인")
//            return
//        }
//
//        let task = UserDiary(diaryTitle: title, diaryContent: mainView.contentTextView.text!, diaryDate: Date(), regdate: Date(), photo: nil)
        
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
//
//
//        let task = tasks[sender.tag]
//        if task.shopLike == true{
//            try! localRealm.write {
//                task.shopLike = false
//            }
//        } else {
//            try! localRealm.write{
//                task.shopLike = true
//            }
//        }
//        shoppingView.tableView.reloadData()
        
        /*
         @objc func checkboxButtonClicked(_ sender: UIButton){
             let task = tasks[sender.tag]
             if task.shopCheck == true{
                 try! localRealm.write {
                     task.shopCheck = false
                 }
             } else {
                 try! localRealm.write{
                     task.shopCheck = true
                 }
             }
             shoppingView.tableView.reloadData()
         }
         */

        print(localRealm)
        let tasks = localRealm.objects(UserShopList.self)
        print("localRealm: \(tasks)")
        let taskNumber = tasks[sender.tag]
        guard let name = detailView.shoppingName.text else { return }
        
        print("task - shopList: \(taskNumber.shopList)")
        print("name: \(detailView.shoppingName.text)")
        print("task - objectID: \(taskNumber.objectID)")
        print("task - sender.tag.count: \(sender.tag)")

        for i in tasks {
            if i.shopList == "\(name)" {
                print("일치")
                
                try! localRealm.write {
                    guard let image = detailView.shoppingImage.image else { return }
                    savaImageToDocument(filename: "\(i.objectID).jpg", image: image)
                }
                
            } else {
                 print("불일치")
            }
        }
        
   

        
//        if taskNumber.shopList == name{
//            try! localRealm.write {
//                guard let image = detailView.shoppingImage.image else { return }
//                savaImageToDocument(filename: "\(taskNumber.objectID).jpg", image: image)
//            }
//        }
//
        
        
        
        
        
        
        
        
        /* 도전
         guard let name = detailView.shoppingName.text else { return }
         
         let task = UserShopList(shopList: "", shopImage: "")
         
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
         */
        
        
        
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
