import UIKit
import RxCocoa
import RxSwift

class RxCocoaExampleViewController: UIViewController {
    
    // MARK: code 경로: RxSwift>RxCocoa>iOS>UITableView+RX, UIPickerView+RX
    @IBOutlet weak var simpleTableView: UITableView!
    @IBOutlet weak var simplePickerView: UIPickerView!
    @IBOutlet weak var simpleLabel: UILabel!
    @IBOutlet weak var simpleSwitch: UISwitch!
    
    @IBOutlet weak var signName: UITextField!
    @IBOutlet weak var signEmail: UITextField!
    @IBOutlet weak var signButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setPickerView()
        setSwitch()
        setSign()
        setOperator()
    }
    
    func setOperator(){
        
//        Observable.repeatElement("jack") // 네트워크 실패시 몇번 제약을 줄 것인지 세부 제안을 할 수 있음.
//            .subscribe { value in
//                print("repeat - \(value)")
//            } onError: { error in
//                print("repeat - \(error)")
//            } onCompleted: {
//                print("repeat completed")
//            } onDisposed: {
//                print("repeat disposed")
//            }
//            .disposed(by: disposeBag)
        
        let intervalObsevable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe { value in
                print("interval - \(value)")
            } onError: { error in
                print("interval - \(error)")
            } onCompleted: {
                print("interval completed")

            } onDisposed: {
                print("interval disposed")
            }
//            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            intervalObsevable.dispose()
            
        }
        let itemsA = [3.3, 4.0, 5.0, 2.0, 3.6, 4.8]
        let itemsB = [2.3, 2.0, 1.3]
        
        Observable.just(itemsA)
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print("just - \(error)")

            } onCompleted: {
                print("just completed")

            } onDisposed: {
                print("just disposed")
            }
            .disposed(by: disposeBag)
        
        Observable.of(itemsA)
            .subscribe { value in
                print("of - \(value)")
            } onError: { error in
                print("of - \(error)")

            } onCompleted: {
                print("of completed")

            } onDisposed: {
                print("of disposed")
            }
            .disposed(by: disposeBag)
        
        Observable.from(itemsA)
            .subscribe { value in
                print("from - \(value)")
            } onError: { error in
                print("from - \(error)")

            } onCompleted: {
                print("from completed")

            } onDisposed: {
                print("from disposed")
            }
            .disposed(by: disposeBag)
    }
    
    func setSign(){
        //ex. textfield1(observable), textfield2(observable) > label(observaber, bind)
        Observable.combineLatest(signName.rx.text.orEmpty, signEmail.rx.text.orEmpty) { value1, value2 in
            return "name은 \(value1)이고, email은  \(value2)입니다."
        }
        .bind(to: simpleLabel.rx.text)
        .disposed(by: disposeBag)
        
        signName.rx.text.orEmpty
            .map { $0.count < 4}
            .bind(to: signEmail.rx.isHidden, signButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        signEmail.rx.text.orEmpty
            .map { $0.count > 4 }
            .bind(to: signButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        signButton.rx.tap
            .subscribe { _ in
                self.showAlert()
            }
            .disposed(by: disposeBag)
        
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "된다된다", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func setSwitch(){
        Observable.just(false) // just? of?
            .bind(to: simpleSwitch.rx.isOn)
            .disposed(by: disposeBag)
    }

    
    func setTableView(){
        simpleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
        ])
        items
            .bind(to: simpleTableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element) @ row \(row)"
                return cell
            }
        
        // MARK: 마지막에 .disposed를 해야 한다.
            .disposed(by: disposeBag)
        
        simpleTableView.rx.modelSelected(String.self)
            . map { data in
                "\(data)를 클릭했습니다."
            }
            .bind(to: simpleLabel.rx.text)
        //            .subscribe { value in
        //                print(value)
        //            } onError: { error in
        //                print("error")
        //            } onCompleted: {
        //                print("completed")
        //            } onDisposed: {
        //                print("disposed")
        //            }
// MARK: 마지막에 .disposed를 해야 한다.
            .disposed(by: disposeBag)
    }
    
    func setPickerView(){
        let items = Observable.just([
            "영화",
            "애니메이션",
            "드라마",
            "기타"
        ])
        
        items
            .bind(to: simplePickerView.rx.itemTitles) { (row, element) in
                return element
            }
            .disposed(by: disposeBag)
        
        simplePickerView.rx.modelSelected(String.self)
            .map { $0.description }
            .bind(to: simpleLabel.rx.text) // 왜 바로 안보여주지? 스트링 배열로 출력되기 때문이다.
//            .subscribe(onNext: { value in
//                print(value)
//            })
            .disposed(by: disposeBag)
    }
    
}
