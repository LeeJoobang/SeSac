//
//  TestViewController.swift
//  SeSac2Week
//
//  Created by Joobang Lee on 2022/07/12.
//

import UIKit

class TestViewController: UIViewController {
//태그값을 가져온다. 모든 태그는 0이다. 구별을 해준다.
    
    @IBOutlet weak var emotionFirstButton: UIButton!
    @IBOutlet weak var emotionFirstLabel: UILabel!
    
    
    
    
    
    var emotionArr = [0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionFirstButton.tag = 0 // 이거 유용
        
        

    }
    
    @IBAction func emotionFirstClicked(_ sender: UIButton) {
        print(sender.tag, sender.currentTitle, sender.currentImage)
        
        
        emotionArr[sender.tag] += 1 // 배열 순서에 맞춰 카운트 1일을 더한다.
        
        emotionFirstLabel.textAlignment = .center
        emotionFirstLabel.text = "행복감\(emotionArr[0])"
    }
}
