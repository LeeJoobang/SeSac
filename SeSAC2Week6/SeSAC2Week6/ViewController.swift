import UIKit

import Alamofire
import SwiftyJSON

/*
 1. html tag <> </> 기능
 2. 문자열 대치 메서드
 3. reponse에서 처리하는 것과 보여지는 셀 등에서 처리하는 것의 차이는?
 */
/*
 tableVIew automatincDimension
 - 컨텐츠 양에 따라서 셀 높이가 자유롭게
 - 조건: 레이블 numberofLines 0
 - 조건: tableView height automaticDimension
 - 조건: 레이아웃
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var bloglist: [String] = []
    private var cafelist: [String] = []
    
    var isExpanded = false // false 2줄, true 0으로
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        searchBlog()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension //모든 섹션과 셀에 대해 유동적으로 잡겠다.
        
    }
    
    private func searchBlog(){
        KakaoAPIManager.shared.callRequest(type: .blog, query: "고래밥") { json  in
            print(json)
            
            for item in json["documents"].arrayValue {
                self.bloglist.append(item["contents"].stringValue)
            }
            self.searchCafe()
        }
    }
    
    func searchCafe(){
        KakaoAPIManager.shared.callRequest(type: .cafe, query: "카페") { json  in
            for item in json["documents"].arrayValue {
                let value = item["contents"].stringValue.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
                self.cafelist.append(value)
            }
            self.tableView.reloadData()
        }
    }
    
    @IBAction func expandCell(_ sender: UIBarButtonItem) {
        isExpanded = !isExpanded
        tableView.reloadData()
        
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? bloglist.count : cafelist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoCell", for: indexPath) as? KakaoCell else { return UITableViewCell() }
        
        cell.testLabel.numberOfLines = isExpanded ? 0 : 2
        cell.testLabel.text = indexPath.section == 0 ? bloglist[indexPath.row] : cafelist[indexPath.row]// 대치 가능함.
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "블로그 검색결과" : "카페 검색결과"
    }
}

class KakaoCell: UITableViewCell {
    @IBOutlet weak var testLabel: UILabel!
}

