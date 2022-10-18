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
//        for index in 1...100{
//            let task = Todo(title: "고래밥의 할일 \(index)", importance: Int.random(in: 1...5))
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }

        // MARK: 4. detailTOdo
        for i in 1...10 {
            let task = DetailTodo(detailTitle: "양파 \(i)개 사기", favorite: false)
        
            try! localRealm.write{
                localRealm.add(task)
            }
        }
        
        // MARK: 특정 todo 테이블에 detatlTodo 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 7'").first else { return }
//
//        let detail = DetailTodo(detailTitle: "프랭크 5개 먹기", favorite: false)
//        try! localRealm.write {
//            task.detail.append(detail )
//        }
        
        // MARK: 특정 todo 테이블에 detailTodo 여러개 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 3'").first else { return }
//
//        let detail = DetailTodo(detailTitle: "깡깡한 아이스크림 \(Int.random(in: 1...5)) 먹기", favorite: false)
//
//        for i in 1...10 {
//            try! localRealm.write {
//                task.detail.append(detail )
//            }
//        }
        
        // MARK: 특정 todo 테이블 삭제
//        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 7'").first else { return }
//
//        try! localRealm.write {
//            localRealm.delete(task.detail)
//            localRealm.delete(task)
//        }
        
        // MARK: 특정 todo에 메모 추가
        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 6'").first else { return }
        
        let memo = Memo()
        memo.content = "이렇게 메모 내용을 추가해봅니다."
        memo.date = Date()
        
        try! localRealm.write{
            task.memo = memo
        }
        

    }
}
