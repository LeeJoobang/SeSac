import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userPickDate: UIDatePicker!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var dDayLabelCollection: [UILabel]!
    @IBOutlet var thatDayCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func userWheelDate(_ sender: UIDatePicker) {
        sender.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let selectedDate = dateFormatter.string(from: sender.date)
        print(selectedDate)
    }
    

}

