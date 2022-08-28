import UIKit
import RealmSwift
import Zip

class BackupViewContoller: BaseViewController {
        
    var backupView = BackupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = backupView
        backupView.backgroundColor = UIColor.white
        backupView.tableView.delegate = self
        backupView.tableView.dataSource = self
        self.backupView.tableView.register(BackupViewCell.self, forCellReuseIdentifier: BackupViewCell.reusableIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   
    override func configureUI() {
        
    }
    
    override func setConstraints() {
        
    }
    
}

extension BackupViewContoller: UITableViewDelegate, UITableViewDataSource, UIDocumentPickerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BackupViewCell.reusableIdentifier, for: indexPath) as! BackupViewCell
        cell.backuplist.text = ""
        cell.backupButton.addTarget(self, action: #selector(backupButtonClicked), for: .touchUpInside)
        cell.restoreButton.addTarget(self, action: #selector(restoreButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func backupButtonClicked(){
        print("======backup======")
        var urlPath = [URL]()
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        let realmFile = path.appendingPathComponent("default.realm")
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            showAlertMessage(title: "백업할 파일이 없습니다.")
            return
        }
        print(realmFile)
        
        urlPath.append(URL(string: realmFile.path)!)
        
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPath, fileName: "SeSACShopping_1")
            print("Active Location: \(zipFilePath)")
            showActivityViewController()
        }
        catch {
            showAlertMessage(title: "압축을 실패했습니다.")
        }
   }
    
    func showActivityViewController(){
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        let backupFileURL = path.appendingPathComponent("SeSACShopping_1.zip")
        
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        self.present(vc, animated: true)
    }
    
    @objc func restoreButtonClicked(){
        print("======restore======")
        
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        self.present(documentPicker, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func documentDirectoryPath() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDirectory
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("#function: \(#function)")
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else {
            showAlertMessage(title: "선택하실 파일에 오류가 있습니다.")
            return
        }
        
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent)
        if FileManager.default.fileExists(atPath: sandboxFileURL.path){
            let fileURL = path.appendingPathComponent("SeSACShopping_1.zip")
            do {
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile: \(unzippedFile)")
                    self.showAlertMessage(title: "복구가 완료되었습니다.")
                })
                
            } catch {
                showAlertMessage(title: "압축해제에 실패했습니다.")
            }
            
        } else {
            
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                let fileURL = path.appendingPathComponent("SeSACShopping_1.zip")

                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile: \(unzippedFile)")
                    self.showAlertMessage(title: "복구가 완료되었습니다.")
                })
                
            } catch {
                showAlertMessage(title: "압축해제에 실패했습니다.")
            }
        }
    }
    
    func fetchDocumentZipFile(){
        do {
            guard let path = documentDirectoryPath() else { return }
            let docs = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            print("docs: \(docs)")
            
            let zip = docs.filter { $0.pathExtension == "zip" } // 확장자 조건에 맞춰 가져오겠다."zip"
            print("zip: \(zip)")
            
            let result = zip.map { $0.lastPathComponent }
            print("result: \(result)")
            
        } catch {
            print("Error")
        }
        
    }
}
