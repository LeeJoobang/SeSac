import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userPickDate: UIDatePicker!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var dDayLabelCollection: [UILabel]!
    @IBOutlet var thatDayCollection: [UILabel]!
    
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
    
//    func showCalculatedDate(_ sender: UIDatePicker){
//        for number in 0...thatDayCollection.count - 1{
//            thatDayCollection[number].text = finalDate
//            thatDayCollection[number].textAlignment = .center
//            thatDayCollection[number].textColor = .black
//        }
//    }
    
    
    @IBAction func userWheelDate(_ sender: UIDatePicker) {
        userPickDate(sender)
    }
 
    func userPickDate(_ sender: UIDatePicker){
        sender.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let selectedDate = dateFormatter.string(from: sender.date) // selectedDate의 값을 string화 했다.
        let tmp: Date?
        tmp = dateFormatter.date(from: selectedDate)
        
        if let startDate = tmp {
            let count = [100, 200, 300, 400]
            for i in 0...3{
                let calculateDate = Calendar.current.date(byAdding: .day, value: count[i], to: startDate)
                let finalDate = dateFormatter.string(from: calculateDate ?? startDate)
                thatDayCollection[i].text = finalDate
                thatDayCollection[i].numberOfLines = 2
                thatDayCollection[i].sizeThatFits(thatDayCollection[i].frame.size)
            }
        }
    }
    
}
