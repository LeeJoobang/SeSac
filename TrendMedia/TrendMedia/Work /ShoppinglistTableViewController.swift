import UIKit

class ShoppinglistTableViewController: UITableViewController {
    
    @IBOutlet weak var shoppinglistLabel: UITextField!
    
    var list = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func shoppinglistReturn(_ sender: UITextField) {
        list.append(sender.text!)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppinglistTableViewCell", for: indexPath) as! ShoppinglistTableViewCell // as? 타입캐스팅
        cell.shoppinglistLabel.text = list[indexPath.row]
        cell.shoppinglistLabel.font = .boldSystemFont(ofSize: 18)
        //cell.likeStarButton.setTitle("test", for: .normal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
