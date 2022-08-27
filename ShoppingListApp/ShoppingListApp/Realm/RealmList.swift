import Foundation
import RealmSwift
import UIKit

class UserShopList: Object {
    @Persisted var shopCheck: Bool // 제목(필수)
    @Persisted var shopList: String // 내용(필수)
    @Persisted var shopLike: Bool // 즐겨찾기(필수)
    @Persisted var shopImage: String?
    
    @Persisted(primaryKey: true) var objectID: ObjectId

    convenience init(shopList: String, shopImage: String?) {
        self.init()
        self.shopList = shopList
        self.shopCheck = false
        self.shopLike = false
        self.shopImage = shopImage
    }
}

