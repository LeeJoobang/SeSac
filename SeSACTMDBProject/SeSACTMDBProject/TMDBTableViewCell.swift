import UIKit

import Kingfisher

class TMDBTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tmdbTableViewCell: TMDBTableViewCell!
    @IBOutlet weak var tmdbDateLabel: UILabel!
    @IBOutlet weak var tmdbAverageLabel: UILabel!
    @IBOutlet weak var tmdbBackView: UIView!
    @IBOutlet weak var tmdbImageView: UIImageView!
    @IBOutlet weak var tmdbTitleLabel: UILabel!
    @IBOutlet weak var tmdbOverviewLabel: UILabel!
    @IBOutlet weak var tmdbLineLabel: UILabel!
    @IBOutlet weak var tmdbDetailLabel: UILabel!
    @IBOutlet weak var tmdbButton: UIButton!
    @IBOutlet weak var tmdbVideoButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(data: [Movie], indexPath: Int){
        tmdbBackView.layer.cornerRadius = 20
        tmdbBackView.layer.borderWidth = 0.1
        tmdbBackView.layer.borderColor = UIColor.lightGray.cgColor
        tmdbBackView.layer.shadowOpacity = 0.2
        tmdbBackView.layer.shadowColor = UIColor.black.cgColor
        tmdbBackView.layer.shadowOffset = CGSize(width: 0, height: 0)
        tmdbBackView.layer.shadowRadius = 10.0
        tmdbBackView.layer.masksToBounds = true
        tmdbBackView.backgroundColor = .clear
        
        tmdbDateLabel.text = "개봉일: \(data[indexPath].releaseDate)"
        tmdbAverageLabel.text = "평점: \(data[indexPath].average)"
        tmdbImageView.kf.setImage(with: data[indexPath].poster)
        tmdbTitleLabel.text = data[indexPath].title
        tmdbOverviewLabel.text = data[indexPath].overview
        tmdbDetailLabel.text = "자세히 보기"
        tmdbButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        tmdbButton.tintColor = .gray
        
        tmdbDateLabel.textColor = UIColor.gray
        tmdbOverviewLabel.textColor = UIColor.gray
        tmdbDetailLabel.textColor = UIColor.gray
        
        tmdbTitleLabel.font = .boldSystemFont(ofSize: 15)
        tmdbOverviewLabel.font = .boldSystemFont(ofSize: 13)
        tmdbDetailLabel.font = .boldSystemFont(ofSize: 13)

        tmdbLineLabel.layer.borderColor = UIColor.gray.cgColor
        tmdbLineLabel.layer.borderWidth = 5
    }
    
    
}
