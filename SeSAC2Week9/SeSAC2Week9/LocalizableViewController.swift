import Foundation
import UIKit
//import CoreLocation

import MessageUI //메일로 문의 보내기, 디바이스 테스트, 아이폰

// 일본어로는 대응을 하지 않았을 경우에는 일본어로 출력시 하단의 스트링 그대로 표시된다.

class LocalizableViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 해당 문자열 처리시 라이브러리 - swiftgen, r.swift로 할 수 있다.
        
        //나는 8살입니다.
        //i am 8 yesars old.
        // 매개변수로 다국어 대응하기
//        "introduce" = "저는 %@ 입니다."; // string
//        "number_test" = "저는 %lld살 입니다." // int
        
        label.text = "introduce".localized(with: "고래밥")
        
        textField.text = "number_test".localized(number: 11)
        // 타입이 많아지면 이것을 결국 generic으로 대응할 수 있게 된다.
        // 와 ,,,,,,,,,,,,,,
        
        navigationItem.title = "navigation_title".localized
        searchBar.placeholder = "search_placeholder".localized
        textField.placeholder = "main_age_textfield_placeholder".localized
        let buttonTitle = "common_cancel".localized
        button.setTitle(buttonTitle, for: .normal)
       
//       CLLocationManager().requestWhenInUseAuthorization()
    }
    
    func sendMail(){
        if MFMailComposeViewController.canSendMail(){
            //
            let mail = MFMailComposeViewController()
            mail.setToRecipients(["hii5074@gmail.com"])
            mail.setSubject("고래밥 다이어리 문의사항")
            mail.mailComposeDelegate = self
            
            
            self.present(mail, animated: true)
        } else {
            //alert. 메일 등록 해주시거나 hii5074@gmail.com로 문읟주세요.
            print("Alert")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            <#code#>
        case .saved:
            <#code#>
        case .sent:
            <#code#>
        case .failed:
            <#code#>
        }
        controller.dismiss(animated: true)
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(with: String) -> String{
        return String(format: self.localized, with)
    }
    
    func localized(number: Int) -> String{
        return String(format: self.localized, number)
    }
    
}
