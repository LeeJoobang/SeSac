import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userPickDate: UIDatePicker!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var dDayLabelCollection: [UILabel]!
    @IBOutlet var thatDayCollection: [UILabel]!
    
    var finalDate: String?
    
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
        }
    }
    
    func showCalculatedDate(_ sender: UIDatePicker){
        for number in 0...thatDayCollection.count - 1{
            thatDayCollection[number].text = finalDate
            thatDayCollection[number].textAlignment = .center
            thatDayCollection[number].textColor = .black
        }

    }
    
    
    @IBAction func userWheelDate(_ sender: UIDatePicker) {
      userPickDate(sender, plusDay: 100)
      userPickDate(sender, plusDay: 200)
      userPickDate(sender, plusDay: 300)
      userPickDate(sender, plusDay: 400)    }
    
    func userPickDate(_ sender: UIDatePicker, plusDay day: Int){
        sender.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter.string(from: sender.date)
        let startDate = dateFormatter.date(from: selectedDate)
        let calculateDate = Calendar.current.date(byAdding: .day, value: day, to: startDate!)
        finalDate = dateFormatter.string(from: calculateDate!)
        print(finalDate)
    }
    
    
}

