import UIKit
//잭님과 함께하는 enum을 활용하여 코드수정 진행 09:46

enum SettingOptions: Int, CaseIterable { // casrIterable: 프로토콜, 배열처럼 열거형을 활용할 수 있는 특성
    case total, personal, others // 섹션
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var rowTitle: [String]{
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 각 section의 row의 갯수를 부여한다.
        // settingoptions.allcase[0] => total 나온다.
//        print(section)
//        print(SettingOptions.allCases[section].rowTitle.count)
        return SettingOptions.allCases[section].rowTitle.count
    }
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        return cell
    }
    
    // 1
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].sectionTitle
    }
    
    
}

/*
 이 코드는 내가 07.18(월) 작성한 코드이다. 해당 코드의 경우 네비게이션 바의 표시에 실패하였음.
 
 import UIKit
 class SettingTableViewController: UITableViewController {
     
     let header = ["전체 설정", "개인 설정", "기타"]
     let data = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터"] ]
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.addSubview(addNavigationBar())
     }
     
     func addNavigationBar() -> UIView{
         let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: 44))
         navigationBar.backgroundColor = .red
         let navigationTitle = UINavigationItem()
         navigationTitle.title = "설정"
         return navigationBar
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
     
     override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         let header = view as! UITableViewHeaderFooterView
         header.contentView.backgroundColor = UIColor.black
     }
     
     override func numberOfSections(in tableView: UITableView) -> Int {
         return header.count
     }
     
     override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
         return " "
     }
     
     override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
         let footer = view as! UITableViewHeaderFooterView
         footer.contentView.backgroundColor = UIColor.black
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
         cell.translatesAutoresizingMaskIntoConstraints = false
         return cell
     }
 }

 */
