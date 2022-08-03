import UIKit

import Kingfisher

class TMDBTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tmdbTableViewCell: TMDBTableViewCell!
    @IBOutlet weak var tmdbImageView: UIImageView!
    @IBOutlet weak var tmdbTitleLabel: UILabel!
    @IBOutlet weak var tmdbSubTitleLabel: UILabel!
    @IBOutlet weak var tmdbLineLabel: UILabel!
    @IBOutlet weak var tmdbDetailLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(data: [Movie], indexPath: Int){
        tmdbImageView.kf.setImage(with: data[indexPath].poster)
        tmdbTitleLabel.text = data[indexPath].title

        tmdbSubTitleLabel.text = "임시 데이터 입력"
        tmdbDetailLabel.text = "임시 더보기 표시"
        
        tmdbTitleLabel.font = .boldSystemFont(ofSize: 15)
        tmdbSubTitleLabel.font = .boldSystemFont(ofSize: 15)
        tmdbDetailLabel.font = .boldSystemFont(ofSize: 15)

        tmdbLineLabel.layer.borderColor = UIColor.red.cgColor
        tmdbLineLabel.layer.borderWidth = 5
    }
    
}
