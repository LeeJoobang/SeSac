import UIKit
import RealmSwift //Realm 1. import


class ShoppingViewController: BaseViewController {
        
    var shoppingView = ShoppingView()
    let localRealm = try! Realm() // Realm 2.
    
    var tasks: Results<UserShopList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = shoppingView
        shoppingView.backgroundColor = UIColor.white
        shoppingView.tableView.delegate = self
        shoppingView.tableView.dataSource = self
        
        self.shoppingView.tableView.register(ShoppingTableViewCell.self, forCellReuseIdentifier: ShoppingTableViewCell.reusableIdentifier)

        print("Realm is located at:", localRealm.configuration.fileURL!) //스니펫에 저장해서 써도 무방
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tasks = localRealm.objects(UserShopList.self)
        shoppingView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        let sortButton = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(showAlertAction))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    @objc func showAlertAction(){
        let alert = UIAlertController(title: "정렬", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "할일 기준 정렬", style: .default, handler: { UIAlertAction in
            self.tasks = self.localRealm.objects(UserShopList.self).sorted(byKeyPath: "shopCheck", ascending: false)
            self.shoppingView.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "즐겨찾기 순 정렬", style: .default, handler: { UIAlertAction in
            self.tasks = self.localRealm.objects(UserShopList.self).sorted(byKeyPath: "shopLike", ascending: false)
            self.shoppingView.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "제목 순 정렬 기준", style: .default, handler: { UIAlertAction in
            self.tasks = self.localRealm.objects(UserShopList.self).sorted(byKeyPath: "shopList", ascending: true)
            self.shoppingView.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        present(alert, animated: true)
        
    }
   
    @objc func searchButtonClicked(){
        let task = UserShopList(shopList: shoppingView.searchTextField.text ?? "")
        try! localRealm.write {
            localRealm.add(task)
            print("Realm Succeed")
        }
        shoppingView.tableView.reloadData()
    }
    
    override func configureUI() {
    }
    
    override func setConstraints() {
        
    }
}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.reusableIdentifier, for: indexPath) as! ShoppingTableViewCell
        
        cell.shoppingName.text = tasks[indexPath.row].shopList // 셀 데이터 표시
        
        let check = tasks[indexPath.row].shopCheck ? "checkmark.square" : "square"
        cell.checkBoxButton.setImage(UIImage(systemName: check), for: .normal)
        let like = tasks[indexPath.row].shopLike ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: like), for: .normal)
        
        cell.checkBoxButton.addTarget(self, action: #selector(checkboxButtonClicked), for: .touchUpInside)
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        cell.checkBoxButton.tag = indexPath.row
        cell.likeButton.tag = indexPath.row

        return cell
    }
    
    @objc func checkboxButtonClicked(_ sender: UIButton){
        let task = tasks[sender.tag]
        if task.shopCheck == true{
            try! localRealm.write {
                task.shopCheck = false
            }
        } else {
            try! localRealm.write{
                task.shopCheck = true
            }
        }
        shoppingView.tableView.reloadData()
    }
    
    @objc func likeButtonClicked(_ sender: UIButton){
        let task = tasks[sender.tag]
        if task.shopLike == true{
            try! localRealm.write {
                task.shopLike = false
            }
        } else {
            try! localRealm.write{
                task.shopLike = true
            }
        }
        shoppingView.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            try! localRealm.write{
                localRealm.delete(tasks[indexPath.row])
            }
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        transition(vc, transitionStyle: .push)
    }
}
