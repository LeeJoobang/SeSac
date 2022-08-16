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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.alpha = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
            일기를 씁시다!
            잘 써봅시다!
            """
        
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.tutorialLabel.alpha = 1
        } completion: { _ in
            self.animateBlackView()
            print("Complete")
        }
    }
    
    func animateBlackView(){
        UIView.animate(withDuration: 1) {
            self.blackView.frame.size.width += 250
            self.blackView.alpha = 1
            self.blackView.layoutIfNeeded()
        } completion: { _ in
            print("Complete")
        }
        
    }
}
