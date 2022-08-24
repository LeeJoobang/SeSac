import UIKit
import SnapKit

class ShoppingTableViewCell: BaseViewCell {
    
    let checkBoxButton: UIButton = {
        let check = UIButton()
        check.backgroundColor = .systemGray3
        check.layer.borderWidth = 1
        check.layer.borderColor = UIColor.black.cgColor
        return check
    }()
    
    let shoppingName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let likeButton: UIButton = {
        let like = UIButton()
        like.layer.borderWidth = 1
        like.layer.borderColor = UIColor.black.cgColor
        like.backgroundColor = .systemGray3
        return like
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none

    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [checkBoxButton, shoppingName, likeButton].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(10)
            make.height.equalTo(contentView.snp.height).multipliedBy(1)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.15)
        }
        
        shoppingName.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.checkBoxButton.snp.trailing).offset(10)
            make.height.equalTo(contentView.snp.height).multipliedBy(1)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.6)
        }

        likeButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.shoppingName.snp.trailing).offset(10)
            make.height.equalTo(contentView.snp.height).multipliedBy(1)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.15)
        }

    }
    
    
    
    
}
