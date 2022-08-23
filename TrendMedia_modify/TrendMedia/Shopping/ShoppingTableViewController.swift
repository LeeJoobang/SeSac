import UIKit

import RealmSwift // realm 1. import
class ShoppingTableViewController: UITableViewController {
    
    let localRealm = try! Realm() // reaml2 . 로컬 접속

    @IBOutlet weak var shoppingTextField: UITextField!
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var mainUIView: UIView!
    
    var shoppingList:[String] = []
    
    var tasks: UserShopList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("realm is located at: ", localRealm.configuration.fileURL!)

        // 상단 뷰 설정
        mainUIView.backgroundColor = .systemGray5
        mainUIView.layer.cornerRadius = 8
        tableView.rowHeight = 56
        
        restoreButton.setTitle("추가", for: .normal)
        restoreButton.setTitleColor(.black, for: .normal)
        restoreButton.backgroundColor = UIColor.systemGray4
        restoreButton.layer.cornerRadius = 4
        
        designTextField(item: shoppingTextField)

    }

    // textField action
    @IBAction func shoppingListTextField(_ sender: UITextField) {
        
    }
    
    // 추가 버튼 action(버튼을 누르면 textfield 비워주고, 키보드 올라와있으면 내려주고, 빈칸일 때 누르면 alert띄워주기)
    @IBAction func restoreButtonTapped(_ sender: UIButton) {
        guard let shopping = shoppingTextField.text else { return }
        shopping == "" ? showAlertController() : shoppingList.append(shopping)
        tableView.reloadData()
        shoppingTextField.text = ""
        view.endEditing(true)
        
        
        try! localRealm.write {
            localRealm.add(tasks!) // 35번째 줄에서 실제로 생성(Create)이 된다. 경로에 레코드를 추가해주라
            // 왜 try? 안전하게 데이터를 가져오기 위해서. 8/22 여기까지만 배우자!
            print("Realm Succeed")
            dismiss(animated: true)
        }
        
    }
    
    func designTextField(item : UITextField) {
        item.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실 건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        item.backgroundColor = .systemGray5
        item.borderStyle = .none
    }
    
    // cell 개수 정해주기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    // cell design 및 데이터
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell
        
        // cell의 design + data
        cell.backgroundColor = .systemGray5
        
        cell.shoppingListLabel.text = shoppingList[indexPath.row]
        cell.shoppingListLabel.font = .boldSystemFont(ofSize: 13)
        
        cell.bookmarkButton.tag = indexPath.row
        cell.checkboxButton.tag = indexPath.row
        
        // cell안에있는 button 활성화
        cell.bookmarkButton.tintColor = .black
        cell.checkboxButton.tintColor = .black
        
//        if task?.shopCheck == true {
//            cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
//        } else {
//            cell.checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
//        }
//
//        if task?.shopLike == true {
//            cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
//        } else {
//            cell.bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
//        }

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // textfield 비어있을 때 alert action
    func showAlertController() {
        
        let alert = UIAlertController(title: "경고", message: "다시 입력해주세요", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
   
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
}
