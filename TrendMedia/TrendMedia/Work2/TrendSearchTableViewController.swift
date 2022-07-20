import UIKit

class TrendSearchTableViewController: UITableViewController {

    var movieList = MovieInfo() // MovieInfo().movie 로 할 수는 없을까? 현재는 프로퍼티가 하나만 있지만, 여러개의 프로퍼티가 있을 수 있으니 하나의 구조체에 대해 인스턴스 생성 후 활용하는 것이 좋다
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TrendSearchTableViewCell", for: indexPath) as! TrendSearchTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    
}
