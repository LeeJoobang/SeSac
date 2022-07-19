import UIKit

class TrendSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var trendMovieImageView: UIImageView!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
