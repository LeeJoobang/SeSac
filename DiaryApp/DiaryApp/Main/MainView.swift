import UIKit
import SnapKit

class MainView: BaseView{
    
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    let titleTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .clear
        text.placeholder = "메인제목"
        text.textAlignment = .center
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        return text
    }()

    let subTitleTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .clear
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.placeholder = "부제목"
        text.textAlignment = .center
        return text
    }()

    let subImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        
        [mainImageView, searchButton, titleTextField, subTitleTextField, subImageView].forEach {
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
        
        searchButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.mainImageView.snp.bottom).offset(-5)
            make.trailing.equalTo(self.mainImageView.snp.trailing).offset(-5)
            make.width.height.equalTo(50)
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
