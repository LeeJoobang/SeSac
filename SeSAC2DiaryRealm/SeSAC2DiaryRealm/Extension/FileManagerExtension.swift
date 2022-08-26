import UIKit
extension UIViewController { // 이전 위치는 주석으로 남겨놓았다.
    
    func documentDirectoryPath() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } // document 경로를 가져올 수 있따.
        return documentDirectory
    }
    
    func loadImageFromDocument(filename: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } // document 경로를 가져올 수 있따.
        // ex) file:///Users/joobanglee/Library/Developer/CoreSimulator/Devices/EE7FB4FC-8C3C-477D-BE12-92617771247F/data/Containers/Data/Application/1A88C18A-E6C7-41A1-800C-0A5E2419A6C8/Documents/ 여기까지 보여준당
        let fileURL = documentDirectory.appendingPathComponent(filename) // 세부파일 경로, 이미지를 저장할 위치가 된다.
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        } else {
            return UIImage(systemName: "star.fill")
        }
    //
    //        let image = UIImage(contentsOfFile: fileURL.path)
    //        return image
    }


    
    func savaImageToDocument(filename: String, image: UIImage){
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } // document 경로를 가져올 수 있따.
        // ex) file:///Users/joobanglee/Library/Developer/CoreSimulator/Devices/EE7FB4FC-8C3C-477D-BE12-92617771247F/data/Containers/Data/Application/1A88C18A-E6C7-41A1-800C-0A5E2419A6C8/Documents/ 여기까지 보여준당
        let fileURL = documentDirectory.appendingPathComponent(filename) // 세부파일 경로, 이미지를 저장할 위치가 된다.
        guard let data = image.jpegData(compressionQuality: 0.5) else { return } // 이미지를 압축한다.
        
        do {
            try data.write(to: fileURL)
        } catch let error{
            print("file save error", error)
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

