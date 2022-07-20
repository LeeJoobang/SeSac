import UIKit

class TrendSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var trendMovieImageView: UIImageView!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    
    func configureCell(data: Movie) {
        movieTitleLabel.text = data.title
        movieTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        movieDateLabel.text = "개봉일: \(data.releaseDate) 시간: \(data.runtime)분, 평점: \(data.rate)점"
        movieDateLabel.font = .boldSystemFont(ofSize: 12)

        movieSummaryLabel.text = data.overview
        movieSummaryLabel.font = .boldSystemFont(ofSize: 13)
    }
    
}
