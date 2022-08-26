import UIKit
import SnapKit

class BackupViewCell: BaseTableViewCell {
    
    let backuplist: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 0.5
        label.textAlignment = .center
        label.text = "백업리스트"
        label.textAlignment = .center
        return label
    }()
    
    let backupButton: UIButton = {
        let backup = UIButton()
        backup.backgroundColor = .systemGray3
        backup.layer.borderColor = UIColor.black.cgColor
        backup.layer.borderWidth = 0.5
        backup.setImage(UIImage(systemName: "externaldrive"), for: .normal)
        backup.tintColor = .black
        return backup
    }()
    
    let restoreButton: UIButton = {
        let restore = UIButton()
        restore.backgroundColor = .systemGray3
        restore.layer.borderColor = UIColor.black.cgColor
        restore.layer.borderWidth = 0.5
        restore.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        restore.tintColor = .black
        return restore
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        [backuplist, backupButton, restoreButton].forEach {
            self.contentView.addSubview($0)
        }
    }

    override func setConstraints() {
        backuplist.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(contentView.snp.height).multipliedBy(1)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.7)
        }
        
        backupButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(backuplist.snp.trailing)
            make.height.equalTo(contentView.snp.height).multipliedBy(1)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.15)
        }

        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(backupButton.snp.trailing)
            make.height.equalTo(contentView.snp.height).multipliedBy(1)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.15)
        }
    }
}
