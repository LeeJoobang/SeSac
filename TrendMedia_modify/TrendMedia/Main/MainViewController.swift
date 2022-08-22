import UIKit
import SnapKit

import RealmSwift // realm 1. import

class MainViewController: UIViewController {
    
    let localRealm = try! Realm() // reaml2 . 로컬 접속
    
    let tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .lightGray
        return view
        
    }()
    
    var tasks: Results<UserShopList>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. 정렬 후 담기
        tasks = localRealm.objects(UserShopList.self).sorted(byKeyPath: "shopList", ascending: false)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        // 화면 갱신은 화면 전환 코드 및 생명 주기 실행 점검 필요
        //present, overcurrnt 안됨
        tasks = localRealm.objects(UserShopList.self).sorted(byKeyPath: "shopList", ascending: false)
        tableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = tasks[indexPath.row].shopList
        return cell
    }
    
}
