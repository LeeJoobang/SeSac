import UIKit
import SnapKit

class MainView: BaseView{
    
    let logoButton: UIButton = {
        let button = UIButton()
        button.setTitle("N", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        return button
    }()
    
    let tvProgramButton: UIButton = {
        let button = UIButton()
        button.setTitle("TV 프로그램", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let movieButton: UIButton = {
        let button = UIButton()
        button.setTitle("영화", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let contentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("내가 찜한 콘텐츠", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { // protocol 문법 구조를 지켜주기 위해서
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [logoButton, tvProgramButton, movieButton, contentsButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        logoButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leadingMargin.equalTo(20)
            make.height.equalTo(50)
        }
        
        tvProgramButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.logoButton.snp.bottom)
            make.leadingMargin.equalTo(self.logoButton.snp.trailing).offset(30)
        }
        
        movieButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.logoButton.snp.bottom)
            make.leadingMargin.equalTo(self.tvProgramButton.snp.trailing).offset(30)

        }

        contentsButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.logoButton.snp.bottom)
            make.leadingMargin.equalTo(self.movieButton.snp.trailing).offset(30)
        }
    }
}
