import UIKit
import SnapKit

class MainView: BaseView{
    
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    
    let titleTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .red
        text.placeholder = "메인제목"
        return text
    }()

    let subTitleTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .red
        text.placeholder = "부제목"
        return text
    }()

    let subImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [mainImageView, titleTextField, subTitleTextField, subImageView].forEach {
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
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(self.mainImageView.snp.bottom).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        
        subTitleTextField.snp.makeConstraints { make in
            make.top.equalTo(self.titleTextField.snp.bottom).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        
        subImageView.snp.makeConstraints { make in
            make.top.equalTo(self.subTitleTextField.snp.bottom).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
        }
        
    }
}
