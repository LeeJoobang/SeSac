import UIKit

/*
 swift protocol
 - delegate
 - dataSource
 
 1. 왼팔 / 오른팔 을 가져와야한다.
 2. 테이블뷰 아웃렛 연결
 3. 1+2 연결을 해줬다. .delegate = self
 
 */
extension UIViewController {
    func setBackgroundColor(){
        view.backgroundColor = .red
    }
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTableView: UITableView!
    
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
        
    }
    
    func configureView() {
        searchTableView.backgroundColor = .clear
        searchTableView.separatorColor = .clear
        searchTableView.rowHeight = 60
    }
    
    func configureLabel() {
        
    }
    // 작성한 프로토콜을 불렀다.

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "Hello"
        
        return cell
    }

}
