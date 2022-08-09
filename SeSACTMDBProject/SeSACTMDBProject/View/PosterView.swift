//
//  PosterView.swift
//  SeSACTMDBProject
//
//  Created by Joobang Lee on 2022/08/09.
//

import UIKit

class PosterView: UIView {

 
    @IBOutlet weak var PosterLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        let view = UINib(nibName: "PosterView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .lightGray
        self.addSubview(view)
    }
    
    
}
