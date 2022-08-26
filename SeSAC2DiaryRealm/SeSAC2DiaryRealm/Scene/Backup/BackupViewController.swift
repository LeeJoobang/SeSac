import UIKit
import RealmSwift 

class BackupViewContoller: BaseViewController {
        
    var backupView = BackupView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = backupView
        backupView.backgroundColor = UIColor.white
        backupView.tableView.delegate = self
        backupView.tableView.dataSource = self
        self.backupView.tableView.register(BackupViewCell.self, forCellReuseIdentifier: BackupViewCell.reuseIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   
    
    override func configure() {
        
    }
    override func setConstraints() {
        
    }
    
    /*
    func backupButtonClicked(){
        var urlPath = [URL]()
        // 도큐먼트 위치에 백업 파일 확인
        guard let path = documentDirectoryPath() else { // 도큐먼트를 위치를 가져오고 문제가 있으면 메세지를 뜨운다.
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        print(path)
        
        // 이제 렘파일을 가져올 것이다. 문제가 있으면 메세지를 띄운다.
        let realmFile = path.appendingPathComponent("default.realm") //"default.realm" 애는 단순한 url
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            showAlertMessage(title: "백업할 파일이 없습니다.")
            return
        }
        print(realmFile)
        
        urlPath.append(URL(string: realmFile.path)!)
        
        // 백업 파일을 압축하고 완료 후 = 백업파일에 대한 url배열을 만들고, realm파일의 경로 기반으로 압축 파일을 만든다.
        // AcitivityViewController를 띄운다.
        // 도큐먼트 위치 확인 어떻게 알죠??
        
    }
    
    func restoreButtonClicked(){
        
    }
     */
}

extension BackupViewContoller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BackupViewCell.reuseIdentifier, for: indexPath) as! BackupViewCell
        
        cell.backupButton.addTarget(self, action: #selector(backupbuttonClicked), for: .touchUpInside)
        cell.restoreButton.addTarget(self, action: #selector(restorebuttonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func backupbuttonClicked(){
        print("======backup======")
    }
    
    @objc func restorebuttonClicked(){
        print("======restore======")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
