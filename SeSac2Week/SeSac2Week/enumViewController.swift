//
//  enumViewController.swift
//  SeSac2Week
//
//  Created by Joobang Lee on 2022/07/12.
//

import UIKit

enum AppleDevice: Int {
    case iPhone = 0
    case iPad = 1
    case watch = 2
}


class enumViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //만약 기본값으로 보고 싶다. 그럼 ibaction 함수를 여기서 먼저 호출하면 된다.
        segmentCotrolValuedChanged(segmentControl)
        

    }
    
    @IBAction func segmentCotrolValuedChanged(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == AppleDevice.iPhone.rawValue {
            resultLabel.text = "첫번째 선택"

        } else if segmentControl.selectedSegmentIndex == AppleDevice.iPad.rawValue {
            resultLabel.text = "두번째 선택"

        } else if segmentControl.selectedSegmentIndex == AppleDevice.watch.rawValue{
            resultLabel.text = "세번째 선택"

        } else {
            resultLabel.text = "오류"

        }
        
        
        
//        if segmentControl.selectedSegmentIndex == 0{
//            resultLabel.text = "첫번째 선택"
//        } else if segmentControl.selectedSegmentIndex == 1{
//            resultLabel.text = "두번째 선택"
//        } else if segmentControl.selectedSegmentIndex == 2{
//            resultLabel.text = "세번째 선택"
//        } else {
//            resultLabel.text = "오류"
//        }
    }
}
