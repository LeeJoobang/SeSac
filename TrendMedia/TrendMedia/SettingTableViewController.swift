//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by Joobang Lee on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var birthdayFriends = ["aaaa", "bbbbb", "cccc", "dddd", "eeee"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
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
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 3
        }
    }
    
    //2. 셀 디자인과 데이터(필수) - cellForRowAt
    //ex. 카톡 이점팔, 프로필 사진, 상태메세지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 복붙과 같은 효과를 보여주는 메서드이다.
        // * 100
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                cell.textLabel?.text = birthdayFriends[0]
//            } else if indexPath.row == 1{
//                cell.textLabel?.text = birthdayFriends[1]
//            } else if indexPath.row == 2{
//                cell.textLabel?.text = birthdayFriends[2]
//            }
            cell.textLabel?.text = birthdayFriends[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "1번 인덱스 텍스트"
            cell.textLabel?.textColor = .red
            cell.textLabel?.font = .boldSystemFont(ofSize: 14)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "2번 인덱스 섹션의 텍스트"
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        }
        
        
        
        return cell
    }
}
