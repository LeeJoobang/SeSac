import UIKit
import RealmSwift

class MigrationViewController: UIViewController {
    
    let localRealm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 1. fileURL 출력
        print("File URL: \(localRealm.configuration.fileURL!)")
        
        // MARK: 2. 스키마 버전 확인
        do {
            let version = try schemaVersionAtURL(localRealm.configuration.fileURL!)
            print("schema version: \(version)")
        } catch {
            print(error)
        }
        
        // MARK: Test - 테스트를 위해 한번만 사용한 것이다.
        for index in 1...100{
            let task = Todo(title: "고래밥의 할일 \(index)", importance: Int.random(in: 1...5))
            try! localRealm.write {
                localRealm.add(task)
            }
        }
        
        
    }
}
