import UIKit
import SnapKit

class MainView: BaseView{
    
    let logoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.red, for: .normal)
        button.setTitle("N", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        return button
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { // protocol 문법 구조를 지켜주기 위해서
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [logoButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        logoButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leadingMargin.equalTo(20)
            make.height.equalTo(50)
        }
    }
}
