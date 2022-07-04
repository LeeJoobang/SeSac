//
//  ViewController.swift
//  Movie
//
//  Created by Joobang Lee on 2022/07/04.
//

import UIKit

class ViewController: UIViewController{
   
    @IBOutlet weak var firstImage: UIView!
    
    @IBOutlet weak var secondImage: UIView!
    
    @IBOutlet weak var thirdIImage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstImage.layer.cornerRadius = 60
        secondImage.layer.cornerRadius = 60
        thirdIImage.layer.cornerRadius = 60
        
        self.firstImage.backgroundColor = UIColor(patternImage: UIImage(named: "겨울왕국2.png")!)
        self.secondImage.backgroundColor = UIColor(patternImage: UIImage(named: "아바타.png")!)
        self.thirdIImage.backgroundColor = UIColor(patternImage: UIImage(named: "암살.png")!)
    }
    
}
