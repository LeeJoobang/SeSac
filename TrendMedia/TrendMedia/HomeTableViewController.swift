import UIKit

class HomeTableViewController: UITableViewController {
    
    var birthdayFriends = ["aaaa", "bbbbb", "cccc", "dddd", "eeee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "생일"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 100명"
        } else {
            return "오류"
        }
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footerInSection"
    }
    
    //1. 셀의 갯수(필수) - numberOfRowsInSection
    //ex. 카톡 100명 > 셀100개, 3000명 > 셀 3000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 5
        } else if section == 2 {
            return 5
        } else {
            return 3
        }
    }
    
    //2. 셀 디자인과 데이터(필수) - cellForRowAt
    //ex. 카톡 이점팔, 프로필 사진, 상태메세지 등
    // 재사용 매커니즘
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellforrowat", indexPath)
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell")!
            cell.textLabel?.text = "2번 인덱스 섹션의 텍스트"
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 14)
            cell.detailTextLabel?.text = "디테일 텍스트 레이블"
            // indexPath.row % 2 == 0 or 1
//            if indexPath.row % 2 == 0{
//                cell.imageView?.image = UIImage(systemName: "star.fill")
//                cell.backgroundColor = .lightGray
//            } else {
//                cell.imageView?.image = UIImage(systemName: "star")
//                cell.backgroundColor = .white
//            }
            
            //if문은 너무 복잡하기 때문에, 이런 경우 삼항 연산자를 쓰는 것이다.
            cell.imageView?.image = indexPath.row % 2 == 0 ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
            cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
            
            return cell
        } else {
            // 복붙과 같은 효과를 보여주는 메서드이다.
            // * 100
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            if indexPath.section == 0 {
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .white
                cell.textLabel?.font = .boldSystemFont(ofSize: 14)
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "1번 인덱스 텍스트"
                cell.textLabel?.textColor = .red
                cell.textLabel?.font = .boldSystemFont(ofSize: 14)
            }
            return cell
        }
    }
    
    //셀의 높이(옵션, 빈도 높은) 함수가 먼저 호출된다.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // indexPath == [0, 0]
        if indexPath.section == 0 && indexPath.row == 0 {
            return 400
        } else {
            return 100
        }
    }
}
