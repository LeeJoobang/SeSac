import UIKit
import Zip

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.restoreButtonClicked()
        }
    }
    
    func backupButtonClicked(){
        var urlPath = [URL]()
        // 도큐먼트 위치에 백업 파일 확인
        guard let path = documentDirectoryPath() else { // 도큐먼트를 위치를 가져오고 문제가 있으면 메세지를 뜨운다.
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        // 이제 렘파일을 가져올 것이다. 문제가 있으면 메세지를 띄운다.
        let realmFile = path.appendingPathComponent("default.realm") //"default.realm" 애는 단순한 url
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            showAlertMessage(title: "백업할 파일이 없습니다.")
            return
        }
        print(realmFile)
        
        urlPath.append(URL(string: realmFile.path)!)
        
        // 백업 파일을 압축하고 완료 후 = 백업파일에 대한 url배열을 만들고, realm파일의 경로 기반으로 압축 파일을 만든다.
        do { //압축을 합니다.
            let zipFilePath = try Zip.quickZipFiles(urlPath, fileName: "SeSACDiary_1")
            print("Active Location: \(zipFilePath)")
            showActivityViewController()
        }
        catch { // 압축에 실패할 경우
            showAlertMessage(title: "압축을 실패했습니다.")
        }
        // AcitivityViewController를 띄운다. 하단에 적으면 실패할 경우에도 실행되니 별도 메서드 생성후 작업후 메서드만 두에서 실행
        // 도큐먼트 위치 확인 어떻게 알죠??
    }
    
    func showActivityViewController(){
        
        guard let path = documentDirectoryPath() else { // 도큐먼트를 위치를 가져오고 문제가 있으면 메세지를 뜨운다.
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        // 이제 렘파일을 가져올 것이다. 문제가 있으면 메세지를 띄운다.
        let backupFileURL = path.appendingPathComponent("SeSACDiary_1.zip") //"default.realm" 애는 단순한 url
        
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        self.present(vc, animated: true)
    }
    
    func restoreButtonClicked(){ // 앱을 삭제했다. 아까 백업한 파일을 통해 앱을 복구할 것이다
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false // 여러개를 한번에 선택하지 못하게 막는 프로퍼티
        self.present(documentPicker, animated: true)
    }
}

extension ViewController: UIDocumentPickerDelegate{
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else {
            showAlertMessage(title: "선택하실 파일에 오류가 있습니다.")
            return
        }
        
        // 도큐먼트 위치에 백업 파일 확인
        guard let path = documentDirectoryPath() else { // 도큐먼트를 위치를 가져오고 문제가 있으면 메세지를 뜨운다.
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent) // lastPathComponent: 파일 이름과 확장자를 가져오는 것을 의미한다.
        if FileManager.default.fileExists(atPath: sandboxFileURL.path){
            let fileURL = path.appendingPathComponent("SeSACDiary_1.zip")
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
            
        } else { //파일앱에 있는 데이터를 가져와주는 역할을 한다.
            
            do {
                // 파일 앱의 zip -> 도큐먼ㄷ트 폴더에 복사
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                let fileURL = path.appendingPathComponent("SeSACDiary_1.zip")

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
}

