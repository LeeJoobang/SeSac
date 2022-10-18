import Foundation
import RealmSwift

class Todo: Object{
    @Persisted var title: String
    @Persisted var importance: Int

    @Persisted(primaryKey: true) var objectID: ObjectId
    
    @Persisted var detail: List<DetailTodo>
    @Persisted var memo: Memo? // embededObject는 항상 optional
    
    convenience init(title: String, importance: Int){
        self.init()
        self.title = title
        self.importance = importance
    }
}

class Memo: EmbeddedObject {
    @Persisted var content: String
    @Persisted var date: Date
}

class DetailTodo: Object{
    @Persisted var detailTitle: String
    @Persisted var favorite: Bool
    @Persisted var deadline: Date

    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(detailTitle: String, favorite: Bool){
        self.init()
        self.detailTitle = detailTitle
        self.favorite = favorite
    }
}


