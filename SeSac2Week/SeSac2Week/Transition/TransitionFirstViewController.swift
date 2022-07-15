import UIKit

class TransitionFirstViewController: UIViewController {

    @IBOutlet weak var randamNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰 컨트롤러의 생명주기의 하나이다.
        // 화면이 떴고, 화면이 사라졌다.
        //viewDidLoad, 뷰 컨트롤러가 어떤식으로 화면 전환이 되는지 알고 잇으면 좋다.
        // 실습. viewDidLoad -
        print(#function)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let random = Int.random(in: 1...100)
        print(random, #function)
        randamNumberLabel.text = "\(random)" // 돌아올때마다 실행이 된다.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    //1. 
    @IBAction func unwindTransitionFirstVC(jackSegue: UIStoryboardSegue){
        print("돌아옴")
    }
}
