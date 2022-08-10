//
//  MainTableViewCell.swift
//  SeSAC2Week6
//
//  Created by Joobang Lee on 2022/08/09.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    // contentCollectionView delegate와 datasource가 필요함. => MainViewController에게 위임함
    //
    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
        
        
    }
    
    func setupUI(){ 
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.text = ""
        titleLabel.backgroundColor = .clear
        
        contentCollectionView.backgroundColor = .clear
        contentCollectionView.collectionViewLayout = collectionViewlayout()
    }
    
    func collectionViewlayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: self.bounds.size.height) // 셀 사이즈 변경, 높이값을 이렇게 변경하니 잘린다.
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        
        return layout
    }


}
