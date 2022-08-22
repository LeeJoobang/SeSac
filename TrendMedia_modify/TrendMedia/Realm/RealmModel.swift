import Foundation
import RealmSwift

// userdiary: table name
// @persisted: column name
class UserShopList: Object {
    @Persisted var shopCheck: Bool // 제목(필수)
    @Persisted var shopList: String // 내용(필수)
    @Persisted var shopLike: Bool // 즐겨찾기(필수)
    
    //PK(필수): int, string, UUID(권장), ObjectID(권장)
    @Persisted(primaryKey: true) var objectID: ObjectId

    // primary '0' 이 있습니다.

    convenience init(shopCheck: Bool, shopList: String, shopLike: Bool) {
        self.init()
        self.shopCheck = shopCheck
        self.shopList = shopList
        self.shopLike = shopLike
    }
}

