import UIKit

class DetailView: BaseView {
    
    let shoppingImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
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
    
    let searchImageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "photo"), for: .normal)
        view.tintColor = .red
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 25
        return view
    }()
    
    override func configureUI(){
        [shoppingImage, shoppingName, checkBoxButton, likeButton, searchImageButton].forEach { self.addSubview($0)
        }
    }
    

    override func setConstraints() {
        shoppingImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.4)
        }
        
        searchImageButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.trailing.equalTo(-10)
            make.height.width.equalTo(50)
        }
        
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(self.shoppingImage.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.height.width.equalTo(50)
        }
        
        shoppingName.snp.makeConstraints { make in
            make.top.equalTo(self.shoppingImage.snp.bottom).offset(20)
            make.leading.equalTo(self.checkBoxButton.snp.trailing).offset(10)
            make.height.equalTo(50)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.55)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(self.shoppingImage.snp.bottom).offset(20)
            make.leading.equalTo(self.shoppingName.snp.trailing).offset(10)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }

    }
}
