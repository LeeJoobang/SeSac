//
//  FirstViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Joobang Lee on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tutorialLabel: UILabel!
    
    @IBOutlet weak var blackView: UIView!
    
    @IBOutlet weak var upImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upImageView.image = UIImage(systemName: "star.fill")
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.alpha = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
            일기를 씁시다!
            잘 써봅시다!
            """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        UIView.animate(withDuration: 3) {
            self.tutorialLabel.alpha = 1
        } completion: { _ in
            self.animateBlackView()
            self.animateImageView()
            print("Complete")
        }
        
        
    }
    
    func animateBlackView(){
        UIView.animate(withDuration: 2) {
            self.blackView.transform = CGAffineTransform(scaleX: 3, y: 1)
            self.blackView.alpha = 1
        } completion: { _ in
            print("Complete")
        }
    }
    
    func animateImageView() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.upImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.2)
        }

    }
    
}
