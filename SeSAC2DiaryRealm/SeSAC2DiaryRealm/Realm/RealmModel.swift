import Foundation
import RealmSwift

// userdiary: table name
// @persisted: column name
class UserDiary: Object {
    @Persisted var diaryTitle: String // 제목(필수)
    @Persisted var diaryContent: String? // 내용(옵션)
    @Persisted var diaryDate = Date() // 작성날짜(필수)
    @Persisted var regdate = Date() // 등록날짜(필수)
    @Persisted var favorite: Bool // 즐겨찾기(필수)
    @Persisted var photo: String? // 사진 String(옵션)
    
    //PK(필수): int, string, UUID(권장), ObjectID(권장)
    @Persisted(primaryKey: true) var objectID: ObjectId

    // primary '0' 이 있습니다.
    
    convenience init(diaryTitle: String, diaryContent: String?, diaryDate: Date, regdate: Date, photo: String?) {
        self.init()
        self.diaryTitle = diaryTitle
        self.diaryContent = diaryContent
        self.diaryDate = diaryDate
        self.regdate = regdate
        self.favorite = false
        self.photo = photo
    }
}
