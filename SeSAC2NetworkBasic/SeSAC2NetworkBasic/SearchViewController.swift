import UIKit

import Alamofire
import SwiftyJSON
/*
 swift protocol
 - delegate
 - dataSource
 
 1. 왼팔 / 오른팔 을 가져와야한다.
 2. 테이블뷰 아웃렛 연결
 3. 1+2 연결을 해줬다. .delegate = self
 
 */

/*
  app 실행이 되는 시점이 있다고 하자.
 list: 0 요청이 되고, 응답이 오는데 시간이 걸린다. 얼마나 걸릴지 모른다. 무한 대기가 생길 수 있다. 최초 실행시 list는 0이기 때문에 빌드시 아무것도 표시 안될 것이다. data를 가지고 왔다. list에 추가를 3개 했다. 테이블뷰가 배열이 달라졌다면 리로드를 해줘야 한다. 이 한문장이 되게 중요하다.
 갱신을 할 수 있는 시점이 어디일까?? 리스트가 다 채워진 시점이다.
 
 각 json value - list 테이블 뷰 갱신
 서버응답이 몇개인지 모를 경우에
 
 let movieNm1 = json["boxOfficeResult"]["dailyBoxOfficeList"][0]["movieNm"].stringValue
 let movieNm2 = json["boxOfficeResult"]["dailyBoxOfficeList"][1]["movieNm"].stringValue
 let movieNm3 = json["boxOfficeResult"]["dailyBoxOfficeList"][2]["movieNm"].stringValue
 
 self.list.append(movieNm1)
 self.list.append(movieNm2)
 self.list.append(movieNm3)

 
 */
extension UIViewController {
    func setBackgroundColor(){
        view.backgroundColor = .red
    }
}



class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // boxOffice 배열
    var list: [BoxOfficeModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //연결고리 작업: 테이블 뷰에 왼팔, 오른팔 연결, 테이블 뷰가 해야 할 역할을 뷰 컨트롤러에게 요청을 하는 구문이 20, 21번 줄이다. 이 패턴을 델리게이트 패턴이라고 한다.
        
        searchTableView.backgroundColor = .clear
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        // 테이블 뷰가 사용할 테이블 뷰 셀(xib) 등록
        // 왜 xib? ib는 interface builder의 약자이다. 그렇다면 xib: xml interface builder(과거에는 nib)
        // 스토리보드 내 셀이 없고 별도 셀을 만들어 버리니까 다시 한 번 등록을 해야 한다.
        searchTableView.register(UINib(nibName: ListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.reuseIdentifier) // nibName: listTableViewCell의 이름이가져온다.
      
        searchBar.delegate = self
//        requestBoxOffice(text: "20220801")
        
        requestBoxOffice(text: "20220801")

    }
    
    
    
    func configureView() {
        searchTableView.backgroundColor = .clear
        searchTableView.separatorColor = .clear
        searchTableView.rowHeight = 60
    }
    
    func configureLabel() {
        
    }
    // 작성한 프로토콜을 불렀다.
    
    func yesterDay(text: String) -> String{ // 검색한 날짜 하루 전을 검색어로 변환한다.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        guard let searchDate = dateFormatter.date(from: text) else { return "" }
        let yesterdayDate = searchDate.dayBefore
        let yesterday = dateFormatter.string(from: yesterdayDate)
        return yesterday
    }
    

    func requestBoxOffice(text: String) {
        
        list.removeAll() // 조건 1. 서버 통신 하기 전에 미리 지워주고 시작한다.
        
        // AF: 200~299, Status Code: 301
        // 인증키 제한
        let url = "\(EndPoint.boxOfficeURL)key=d340182e69b5b3c5de430a97df93ab86&targetDt=\(text)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                // self.list.removeAll() // 조건2. 성공할 때만 지워준다. 어떤 것이 더 나은가??
                
                for movie in json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue {
                    let movieNm = movie["movieNm"].stringValue
                    let openDt = movie["openDt"].stringValue
                    let audiAcc = movie["audiAcc"].stringValue
                    
                    let data = BoxOfficeModel(movieTitle: movieNm, releaseDate: openDt, totalCount: audiAcc)
                    self.list.append(data)
                }
                
                self.searchTableView.reloadData()
                print(self.list)

            case .failure(let error):
                print(error)
            }
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "\(list[indexPath.row].movieTitle): \(list[indexPath.row].releaseDate)"
        
        return cell
    }

}


extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestBoxOffice(text: yesterDay(text: searchBar.text!))
    // 이런 코드에 대한 옵셔널 바인딩, 날짜 형태이기 때문에 8글자, 숫자, 날짜로 변경시 유효한 형태의 값인지 등
    // 현재 검색어 : searchBar.text! 를 가지고 yesterDay - 값을 계산하였다.
    }
    
}

extension Date {
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
