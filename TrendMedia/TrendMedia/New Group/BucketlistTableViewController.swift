import UIKit

class BucketlistTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    var list = ["범죄도시2", "탑건", "토르"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.append("마녀")
        list.append("aaaa")

    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        list.append(userTextField.text!)
        // 데이터의 달라지는 시점에 데이터 갱신이 필요합니다!
        tableView.reloadData()
        //tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketlistTableViewCell", for: indexPath) as! BucketlistTableViewCell // as? 타입캐스팅
        cell.bucketlistLabel.text = list[indexPath.row]
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //우측 스와이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            //배열 삭제 후 테이블 뷰 갱신
            list.remove(at: indexPath.row)
            //tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>) // 스르륵 삭제하는거라 애니메이션 확인해보면 좋다.
            tableView.reloadData()
        }
    }
    
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기 핀고정(leading쪽)
//    }

    
}
