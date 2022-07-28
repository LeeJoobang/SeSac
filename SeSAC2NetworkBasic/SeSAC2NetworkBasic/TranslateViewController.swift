import UIKit

//UITextView, UISearchBar, UIPickerView > X
//왜? 특정 뷰에만 채택을 해서
//UIResponderChain > 확인해야함


class TranslateViewController: UIViewController {

    @IBOutlet weak var userInputTextView: UITextView!
    
    let textViewPlaceholderText = "번역하고 싶은 문장을 작성해보세요."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceholderText
        userInputTextView.textColor = .lightGray
        
        
    }
    
    
}

extension TranslateViewController: UITextViewDelegate {
    // 텍스트 뷰의 텍스트가 변할 때 호출
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
    }

    //편집이 시작될 때, 커서가 시작될 때
    //텍스트 뷰 글자: 플레이스 홀더랑 글자가 같으면 clear
    
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
