import UIKit

class ShoppingViewController: BaseViewController {
        
    var shoppingView = ShoppingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = shoppingView
        shoppingView.backgroundColor = UIColor.white
        shoppingView.tableView.delegate = self
        shoppingView.tableView.dataSource = self
        
        self.shoppingView.tableView.register(ShoppingTableViewCell.self, forCellReuseIdentifier: ShoppingTableViewCell.reusableIdentifier)

    }
    
    override func configureUI() {
        
    }
    
    override func setConstraints() {
        
    }
}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.reusableIdentifier, for: indexPath) as! ShoppingTableViewCell 
        return cell
    }
    
    
}
