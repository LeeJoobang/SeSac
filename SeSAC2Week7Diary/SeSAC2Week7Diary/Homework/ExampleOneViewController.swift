import UIKit

import SnapKit

class ExampleOneViewController: UIViewController {

    let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.square"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let presentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shippingbox"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "face.smiling")
        image.tintColor = .white
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jack"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let chatImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bubble.right.fill")
        image.tintColor = .white
        return image
    }()
    
    let profileSetImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil")
        image.tintColor = .white
        return image
    }()
    
    let kakaoStoryImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "leaf.fill")
        image.tintColor = .white
        return image
    }()
    
    let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    let profileSetLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center

        return label
    }()
    
    let kakaoStoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center

        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        addView()
        viewLayout()
    }
    
    private func addView(){
        [cancelButton, settingButton, presentButton, profileImage, nameLabel, chatImage, profileSetImage, kakaoStoryImage, chatLabel, profileSetLabel, kakaoStoryLabel].forEach { view.addSubview($0) }
    }
    
    private func viewLayout(){
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailingMargin.equalTo(-20)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        presentButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(settingButton.snp.leading).offset(-10)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).multipliedBy(1.3) // view의 수직의 정중앙, +0.1 될 수록 하단에 위치하며, -0.1이 될수록 상단에 위치하게 된다.
            make.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.profileImage.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        profileSetImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.width.height.equalTo(30)
        }
        
        chatImage.snp.makeConstraints { make in
            make.top.equalTo(profileSetImage.snp.top)
            make.trailing.equalTo(profileSetImage.snp.leading).offset(-60)
            make.width.height.equalTo(30)
        }
        
        kakaoStoryImage.snp.makeConstraints { make in
            make.top.equalTo(profileSetImage.snp.top)
            make.leading.equalTo(profileSetImage.snp.trailing).offset(60)
            make.width.height.equalTo(30)
        }
        
        profileSetLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(profileSetImage.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(80)

        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(profileSetLabel.snp.top)
            make.trailing.equalTo(profileSetLabel.snp.leading).offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(80)
        }

        kakaoStoryLabel.snp.makeConstraints { make in
            make.top.equalTo(profileSetLabel.snp.top)
            make.leading.equalTo(profileSetLabel.snp.trailing).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(80)
        }

    }
}
