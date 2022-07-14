//
//  DateFommaterViewController.swift
//  SeSac2Week
//
//  Created by Joobang Lee on 2022/07/14.
//

import UIKit

class DateFommaterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dateformatter: 알아보기 쉬운 날짜 + 시간대(yyyy MM dd hh:mm:ss)
        let format = DateFormatter()
        format.dateFormat = "yyyy년 M월 d일"
        
        let result = format.string(from: Date()) // Date() 현재시간
        print(result, Date()) // 이건 영국시간으로 기본값이기 때문이다.
        
        let word = "2022년 3월 2일"
        let dateResult = format.date(from: word)
        print(dateResult) // 3월 2일 0시인데, -9시간(영국)으로 옮겨지기 때문에 실제 찍히는 것은 3월 1일 15시로 찍힌다.
        

    }
    
}
