import UIKit
import SnapKit

class MainView: BaseView{
    
    let logoButton: MainButton = {
        let button = MainButton()
        button.setTitle("N", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        return button
    }()
    
    let tvProgramButton: MainButton = {
        let button = MainButton()
        button.setTitle("TV 프로그램", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let movieButton: MainButton = {
        let button = MainButton()
        button.setTitle("영화", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let contentsButton: MainButton = {
        let button = MainButton()
        button.setTitle("내가 찜한 콘텐츠", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let contentsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "check")
        return image
    }()
    
    let contentsImageButton: MainButton = {
        let button = MainButton()
        button.setTitle("내가 찜한 콘텐츠", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    let playButton: MainButton = {
        let button = MainButton()
        button.setBackgroundImage(UIImage(named: "play_normal"), for: .normal)
        return button
    }()
    
    let infoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info")
        return image
    }()
    
    let infoImageButton: MainButton = {
        let button = MainButton()
        button.setTitle("정보", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let oneImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "movie1")
        return image
    }()
    
    let twoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "movie2")
        return image
    }()
    
    let threeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "movie3")
        return image
    }()
    
    let posterImageView: UIImageView = {
        let image = UIImageView()
        image.alpha = 0.4
        image.image = UIImage(named: "movie4")
        return image
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { // protocol 문법 구조를 지켜주기 위해서
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        [logoButton, tvProgramButton, movieButton, contentsButton, contentsImageView, playButton, infoImageView, contentsImageButton, infoImageButton, previewLabel, oneImageView, twoImageView, threeImageView, posterImageView].forEach {
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
        
        contentsImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.safeAreaLayoutGuide).multipliedBy(1.4)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
        }
        
        contentsImageButton.snp.makeConstraints { make in
            make.top.equalTo(self.contentsImageView.snp.bottom)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
        }
        
        playButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.safeAreaLayoutGuide).multipliedBy(1.45)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(1)

        }
        
        infoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.safeAreaLayoutGuide).multipliedBy(1.4)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(1.7)
        }
        
        infoImageButton.snp.makeConstraints { make in
            make.top.equalTo(self.infoImageView.snp.bottom)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(1.7)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.top.equalTo(self.playButton.snp.bottom).offset(30)
            make.leading.equalTo(10)
            
        }
        
        oneImageView.snp.makeConstraints { make in
            make.top.equalTo(self.playButton.snp.bottom).offset(60)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
            make.height.width.equalTo(100)

        }
        
        twoImageView.snp.makeConstraints { make in
        
            make.top.equalTo(self.playButton.snp.bottom).offset(60)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(1)
            make.height.width.equalTo(100)

        }
        
        threeImageView.snp.makeConstraints { make in
        
            make.top.equalTo(self.playButton.snp.bottom).offset(60)
            make.centerX.equalTo(self.safeAreaLayoutGuide).multipliedBy(1.7)
            make.height.width.equalTo(100)

        }
        
        posterImageView.snp.makeConstraints { make in
        
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.playButton.snp.top)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
    }
}
