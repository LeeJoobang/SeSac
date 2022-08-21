import UIKit
import SnapKit

class SearchView: BaseView{
    
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [mainImageView].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
        }
    }
}
