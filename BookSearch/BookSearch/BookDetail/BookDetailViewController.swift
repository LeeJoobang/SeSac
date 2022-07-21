import UIKit

class BookDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "BookMoreDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BookMoreDetailViewController") as! BookMoreDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
