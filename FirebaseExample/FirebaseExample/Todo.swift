import Foundation
import RealmSwift

class Todo: Object{
    @Persisted var title: String
    
    // MARK: Todo에 table구조의 변화를 준다. + 앱삭제하지 않고 할 수 있는 것을 확인하기 위해 만든 변수
//    @Persisted var content: String
    
    @Persisted var importance: Double
    @Persisted var userDescription: String
    @Persisted var count: Int

    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(title: String, importance: Int){
        self.init()
        self.title = title
        self.importance = Double(importance)
    }

}

