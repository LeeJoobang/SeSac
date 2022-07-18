import UIKit
class SettingTableViewController: UITableViewController {
    let header = ["전체 설정", "개인 설정", "기타"]
    let data = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터"] ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return header[0]
        } else if section == 1{
            return header[1]
        } else if section == 2{
            return header[2]
        } else {
            return "오류"
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " "
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data[0].count
        } else if section == 1{
            return data[1].count
        } else if section == 2{
            return data[2].count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = .gray
        cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        return cell
        
    }
    
}
