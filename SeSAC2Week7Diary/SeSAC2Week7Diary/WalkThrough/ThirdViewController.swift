import UIKit

import SeSAC2Framework

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSesacAlert(title: "hi", message: "되니?", buttonTitle: "이렇게") { _ in
            print("ji")
        }
    }
    

}
