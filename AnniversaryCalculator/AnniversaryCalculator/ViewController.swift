import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userPickDate: UIDatePicker!
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var dDayLabelCollection: [UILabel]!
    @IBOutlet var thatDayCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
    }
    
    func backgroundImage(){
        for number in 0...imageCollection.count - 1{
            imageCollection[number].image = UIImage(named: "img\(number+1)")
            imageCollection[number].contentMode = .scaleToFill
            imageCollection[number].layer.cornerRadius = 20
            imageCollection[number].alpha = 0.8
        }
    }
    
    @IBAction func userWheelDate(_ sender: UIDatePicker) {
        sender.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let selectedDate = dateFormatter.string(from: sender.date)
        print(selectedDate)
    }
    

}

