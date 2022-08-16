import UIKit

import SeSACTMDBFramework

class PosterView: UIView {
 
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        let view = UINib(nibName: PosterView.reuseIdentifier, bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .clear
        self.addSubview(view)
    }
}
