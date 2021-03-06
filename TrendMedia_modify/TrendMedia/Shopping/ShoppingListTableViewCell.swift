//
//  ShoppingListTableViewCell.swift
//  TrendMedia
//
//  Created by Seo Jae Hoon on 2022/07/19.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    
    //삼항연산자 변수나 상수에 담아서 사용해보기
    @IBAction func checkboxButtonTapped(_ sender: UIButton) {
        
        sender.isSelected ? checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .highlighted) : checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        
        sender.isSelected ? bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .selected) : bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
    
    }
    
    
    
}
