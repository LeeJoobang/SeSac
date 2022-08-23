import Foundation
import RealmSwift

class UserShopList: Object {
    @Persisted var shopCheck = false // 제목(필수)
    @Persisted var shopList: String // 내용(필수)
    @Persisted var shopLike = false // 즐겨찾기(필수)
    
    @Persisted(primaryKey: true) var objectID: ObjectId

    convenience init(shopList: String) {
        self.init()
        self.shopList = shopList
    }
}

