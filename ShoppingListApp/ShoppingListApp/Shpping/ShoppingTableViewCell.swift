import UIKit
import SnapKit

class ShoppingTableViewCell: BaseViewCell {
    
    let checkBoxButton: UIButton = {
        let check = UIButton()
        check.backgroundColor = .systemGray3
        check.tintColor = .black
        return check
    }()
    
    let shoppingName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    let likeButton: UIButton = {
        let like = UIButton()
        like.backgroundColor = .systemGray3
        like.tintColor = .black
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
            self.contentView.addSubview($0) // contentview에 올리지 않고, cell 에 곧바로 올렸을 때, 해당 버튼에 대한 클릭이 해결되지 않음을 확인할 수 있었음.
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
