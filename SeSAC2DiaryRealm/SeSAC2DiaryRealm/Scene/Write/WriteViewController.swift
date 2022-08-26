import UIKit
import RealmSwift //Realm 1.

protocol SelectImageDelegate {
    func sendImageData(image: UIImage)
}

class WriteViewController: BaseViewController {

    //let repository = UserDiaryRepository()

    let mainView = WriteView()
    private let localRealm = try! Realm() //Realm 2. Realm 테이블에 데이터를 CRUD할 때, Realm 테이블 경로에 접근
    
    override func loadView() {
        self.view = mainView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print("Realm is located at:", localRealm.configuration.fileURL!) //스니펫에 저장해서 써도 무방
    }
    
    override func configure() {
        mainView.searchImageButton.addTarget(self, action: #selector(selectImageButtonClicked), for: .touchUpInside)
        mainView.sampleButton.addTarget(self, action: #selector(sampleButtonClicked), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))

    }
    
    @objc func closeButtonClicked(){
        dismiss(animated: true)

    }
    
    // realm + 이미지 도큐먼트 저장
    @objc func saveButtonClicked(){
        
        guard let title = mainView.titleTextField.text else {
            showAlertMessage(title: "제목을 입력해주세요.", button: "확인")
            return
        }
        
        let task = UserDiary(diaryTitle: title, diaryContent: mainView.contentTextView.text!, diaryDate: Date(), regdate: Date(), photo: nil)

        do {
            try localRealm.write{
                localRealm.add(task)
            }
        } catch let error {
            print(error)
        }
        
        if let image = mainView.userImageView.image{
            savaImageToDocument(filename: "\(task.objectID).jpg", image: image)
        }
        
        dismiss(animated: true)
    }
    
//    func savaImageToDocument(filename: String, image: UIImage){
//        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } // document 경로를 가져올 수 있따.
//        // ex) file:///Users/joobanglee/Library/Developer/CoreSimulator/Devices/EE7FB4FC-8C3C-477D-BE12-92617771247F/data/Containers/Data/Application/1A88C18A-E6C7-41A1-800C-0A5E2419A6C8/Documents/ 여기까지 보여준당
//        let fileURL = documentDirectory.appendingPathComponent(filename) // 세부파일 경로, 이미지를 저장할 위치가 된다.
//        guard let data = image.jpegData(compressionQuality: 0.5) else { return } // 이미지를 압축한다.
//        
//        do {
//            try data.write(to: fileURL)
//        } catch let error{
//            print("file save error", error)
//        }
//    }
    
    
    //Realm Create Sample
    @objc func sampleButtonClicked() {
         
        let task = UserDiary(diaryTitle: "가오늘의 일기\(Int.random(in: 1...1000))", diaryContent: "일기 테스트 내용", diaryDate: Date(), regdate: Date(), photo: nil) // => Record

        try! localRealm.write {
            localRealm.add(task) //Create
            print("Realm Succeed")
            dismiss(animated: true)
        }
    }
      
    @objc func selectImageButtonClicked() {
        let vc = SearchImageViewController()
        vc.delegate = self
        transition(vc, transitionStyle: .presentNavigation)
    }
}

extension WriteViewController: SelectImageDelegate {
    
    func sendImageData(image: UIImage) {
        mainView.userImageView.image = image
        print(#function)
    }
    
    
}
