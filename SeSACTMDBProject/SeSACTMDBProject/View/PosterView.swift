//
//  PosterView.swift
//  SeSACTMDBProject
//
//  Created by Joobang Lee on 2022/08/09.
//

import UIKit

class PosterView: UIView {
 
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        let view = UINib(nibName: PosterView.reusableIdentifier, bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .lightGray
        self.addSubview(view)
        
        print(view.translatesAutoresizingMaskIntoConstraints)
    }
}
