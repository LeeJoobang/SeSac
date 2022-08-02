//
//  BeerCollectionViewCell.swift
//  SeSAC2NetworkBasic
//
//  Created by Joobang Lee on 2022/08/02.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    
    func configureInfo(data: Beer){
        beerNameLabel.text = data.name
        beerNameLabel.textColor = UIColor.darkGray
        beerNameLabel.font = .boldSystemFont(ofSize: 13)
        
        beerImageView.image = UIImage(named: data.image)
    }
    
}
