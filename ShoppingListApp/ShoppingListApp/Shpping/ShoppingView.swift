import UIKit
import SnapKit

class ShoppingView: BaseView{
    
    let searchTextField: UITextField = {
        let search = UITextField()
        search.backgroundColor = .white
        search.layer.borderColor = UIColor.black.cgColor
        search.layer.borderWidth = 1
        search.textAlignment = .center
        search.placeholder = "구매 예정 중인 상품"
        return search
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [searchTextField, searchButton, tableView].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(self.searchTextField.snp.trailing).offset(-10)
            make.centerY.equalTo(self.searchTextField.snp.centerY)
            make.bottom.equalTo(self.searchTextField.snp.bottom)
            make.width.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
}

