import UIKit
import RealmSwift

class ShoppingListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    //삼항연산자 변수나 상수에 담아서 사용해보기
    @IBAction func checkboxButtonTapped(_ sender: UIButton) {
        let realm = try! Realm()
        let check = realm.objects(UserShopList.self).first!
        if check.shopCheck == true {
            print(check.shopCheck)
            checkboxButton.setImage(UIImage(systemName: "square"), for: .selected)

            try! realm.write{
                check.shopCheck = false
            }
        } else {
            print(check.shopCheck)
            checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)

            try! realm.write{
                check.shopCheck = true
            }
        }
    }

    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        let realm = try! Realm()
        let check = realm.objects(UserShopList.self).first!
        if check.shopLike == true {
            print(check.shopLike)
            checkboxButton.setImage(UIImage(systemName: "star"), for: .selected)
            try! realm.write{
                check.shopLike = false
            }
        } else {
            print(check.shopLike)
            checkboxButton.setImage(UIImage(systemName: "star.fill"), for: .selected)

            try! realm.write{
                check.shopLike = true
            }
        }
    }
}
