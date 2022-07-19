//
//  BucketlistTableViewCell.swift
//  TrendMedia
//
//  Created by Joobang Lee on 2022/07/19.
//

import UIKit

class BucketlistTableViewCell: UITableViewCell {
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var bucketlistLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
