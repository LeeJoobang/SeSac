import UIKit // 애플 내부 우선함.

import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
//    @IBOutlet weak var lottoPickerView: UIPickerView!
    @IBOutlet var lottoNumberCollection: [UILabel]!
    @IBOutlet weak var lottoBonusNumberLabel: UILabel!
    var lottoPickerView = UIPickerView()
    // 코드로 뷰를 만드는 기능이 훨씬 더 많이 남아 있음.
    let numberList: [Int] = Array(1...1025).reversed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.textContentType = .oneTimeCode // 그 시점의 값을 가져올 수 있다. + 인증번호 자동 채우기(automatic strong passwords and security code autofill - 2018 떱떱)
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView // 오 뷰를 lottopicker로 바꾼다.
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
        requestLotto(number: 1025)
    }
    
    func requestLotto(number: Int){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        // AF: 200~299, Status Code: 301
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let date = json["drwNoDate"].stringValue
                let bonus = json["bnusNo"].intValue

                // 반복문으로 lottoNum을 json 값을 입력함.
                for index in 0..<self.lottoNumberCollection.count {
                    self.lottoNumberCollection[index].text = String(describing: json["drwtNo\(index+1)"].intValue)
                }
                self.numberTextField.text = date
                self.lottoBonusNumberLabel.text = String(describing: bonus)

            case .failure(let error):
                print(error)
            }
        }
        
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
        requestLotto(number: numberList[row])
//        numberTextField.text = "\(numberList[row])회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}
