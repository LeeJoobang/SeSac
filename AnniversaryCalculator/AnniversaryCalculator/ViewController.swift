import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userPickDate: UIDatePicker!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var dDayLabelCollection: [UILabel]!
    @IBOutlet var thatDayCollection: [UILabel]!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
        dDayLabel()
    }
    
    func backgroundImage(){
        for number in 0...imageCollection.count - 1{
            imageCollection[number].image = UIImage(named: "img\(number+1)")
            imageCollection[number].contentMode = .scaleToFill
            imageCollection[number].layer.cornerRadius = 20
            imageCollection[number].alpha = 0.3
        }
    }
    
    func dDayLabel(){
        for number in 0...dDayLabelCollection.count - 1{
            dDayLabelCollection[number].text = "D+\(number+1)00"
            dDayLabelCollection[number].sizeToFit()
        }
    }
    
    @IBAction func userWheelDate(_ sender: UIDatePicker) { // 상위함수로서 하위함수의 호출순서 관계들을 관리하고 있다.(코드레벨)
        let userSelectedDate = formatUserPickDate(sender)
        changeLabelDate(userSelectedDate)
    }
    
    func formatUserPickDate(_ sender: UIDatePicker) -> Date? {
        sender.datePickerMode = UIDatePicker.Mode.date
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let selectedDate = dateFormatter.string(from: sender.date) // selectedDate의 값을 string화 했다.
        let formattedDate = dateFormatter.date(from: selectedDate)
        return formattedDate
    }
    
    func changeLabelDate(_ formattedDate: Date?){
        let formattedDate = formattedDate
        
        if let startDate = formattedDate {
            let count = [100, 200, 300, 400]
            for i in 0...3{
                let calculateDate = Calendar.current.date(byAdding: .day, value: count[i], to: startDate)
                let finalDate = dateFormatter.string(from: calculateDate ?? startDate)
                thatDayCollection[i].text = finalDate
            }
        }
    }
}
