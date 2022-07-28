import UIKit

class LottoViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
//    @IBOutlet weak var lottoPickerView: UIPickerView!
    
    var lottoPickerView = UIPickerView()
    // 코드로 뷰를 만드는 기능이 훨씬 더 많이 남아 있음.
    
    let numberList: [Int] = Array(1...1025).reversed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.inputView = lottoPickerView // 오 뷰를 lottopicker로 바꾼다.
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self

    }
    
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return component == 0 ? 10 : 20 // 컨포넌트 갯수 조건문 주는 방법
        return numberList.count

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numberTextField.text = "\(numberList[row])회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}
