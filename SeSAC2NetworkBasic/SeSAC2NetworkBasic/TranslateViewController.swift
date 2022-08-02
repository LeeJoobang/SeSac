import UIKit

import Alamofire
import SwiftyJSON

//UITextView, UISearchBar, UIPickerView > X
//왜? 특정 뷰에만 채택을 해서
//UIResponderChain > 확인해야함

class TranslateViewController: UIViewController {

    @IBOutlet weak var userInputTextView: UITextView!
    @IBOutlet weak var translateTextView: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    
    let textViewPlaceholderText = "번역하고 싶은 문장을 작성해보세요."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceholderText
        userInputTextView.textColor = .lightGray
        userInputTextView.font = UIFont(name: "DalseoHealingMedium", size: 20)
        translateButton.setTitle("번역하기", for: .normal)
        requestTranslatedData(text: textViewPlaceholderText)
    }
    
    func requestTranslatedData(text: String){
        let url = EndPoint.translateURL
        // AF: 200~299, Status Code: 301
        let parameter = ["source":"ko", "target":"en", "text":text]
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .post, parameters: parameter, headers: header).validate(statusCode: 200...500).responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let statusCode = response.response?.statusCode ?? 500
                
                // 번역하기 위한 텍스트 가져오기
                let translatedText = json["message"]["result"]["translatedText"].stringValue
                self.translateTextView.text = translatedText
                self.translateTextView.font = UIFont(name: translateTextView.font?.fontName ?? "", size: 20)
                
                if statusCode == 200 {
                    
                } else {
                    self.userInputTextView.text = json["errorMessage"].stringValue
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func translateButtonClicked(_ sender: UIButton) {
        requestTranslatedData(text: userInputTextView.text!)
    }
    
    
}

extension TranslateViewController: UITextViewDelegate {
    // 텍스트 뷰의 텍스트가 변할 때 호출
    /* 폰트 목록 확인용 코드(7.29)
     func textViewDidChange(_ textView: UITextView) {
         print(textView.text.count)
     }
     //편집이 시작될 때, 커서가 시작될 때
     //텍스트 뷰 글자: 플레이스 홀더랑 글자가 같으면 clear
     
  
     */
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("begin")
        
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
         
    //편집이 끝날 때 커서가 없어지는 순간
    // 다른 뷰에 커서를 놓으면 시작이 된다.
    //텍스트 뷰 글자: 사용자가 아무 글자도 안썼으면 플레이스 홀더 글자 보이게 해!
    func textViewDidEndEditing(_ textView: UITextView) {
        print("End")
        
        if textView.text.isEmpty {
            textView.text = textViewPlaceholderText
            textView.textColor = .lightGray
        }
    }
}
