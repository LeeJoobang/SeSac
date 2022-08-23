import UIKit

import SnapKit

class ShoppingTableViewCell: BaseViewCell {
    
    let checkBoxButton: UIButton = {
        let check = UIButton()
        check.backgroundColor = .brown
        return check
    }()
    
    let shoppingName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let likeButton: UIButton = {
        let like = UIButton()
        like.backgroundColor = .blue
        return like
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [checkBoxButton, shoppingName, likeButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(10)
            make.height.equalTo(50)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.15)
        }
        
        shoppingName.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.checkBoxButton.snp.trailing).offset(10)
            make.height.equalTo(50)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.6)


        }

        likeButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.shoppingName.snp.trailing).offset(10)
            make.height.equalTo(50)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.15)
        }

    }
    
}
