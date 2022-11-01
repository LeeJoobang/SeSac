import UIKit
import RxSwift
import RxCocoa

class SubjectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar! // barvutton으로 변경
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var newButton: UIBarButtonItem!
    
    let publish = PublishSubject<Int>() // 초기값이 없는 빈 상태
    let behavior = BehaviorSubject(value: 100) // 초기값 필수
    let replay = ReplaySubject<Int>.create(bufferSize: 3) // 초기값이 아니라, 미리 갖고 싶은 값의 범위를 정하는 것이다. buffersize 작성된 이벤트 갯수만큼 메모리에서 이벤트를 갖고 있다, subscribe 직후 한번에 이벤트 전달
//    let replay = ReplaySubject<Int>.create(bufferSize: 3) // 초기값이 아니라, 미리 갖고 싶은 값의 범위를 정하는 것이다. buffersize 작성된 이벤트 갯수만큼 메모리에서 이벤트를 갖고 있다, subscribe 직후 한번에 이벤트 전달
    let async = AsyncSubject<Int>()
    
    let disposeBag = DisposeBag()
    let viewModel = SubjectViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        
        
        let input = SubjectViewModel.Input(addTap: addButton.rx.tap, resetTap: resetButton.rx.tap, newTap: newButton.rx.tap, searchText: searchBar.rx.text)
        let output = viewModel.transform(input: input)
                
//        viewModel.list // vm -> vc
//            .asDriver(onErrorJustReturn: [])
        
        output.list
            .drive(tableView.rx.items(cellIdentifier: "ContactCell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.name): \(element.age)세(\(element.number))"
            }
            .disposed(by: disposeBag)
        
        output.addTap
            .withUnretained(self)
            .subscribe { (vc, _) in
                vc.viewModel.fetchData()
            }
            .disposed(by: disposeBag)
        
        output.resetTap
            .withUnretained(self)
            .subscribe { (vc, _) in
                vc.viewModel.resetData()
            }
            .disposed(by: disposeBag)
        
        output.newTap
            .withUnretained(self)
            .subscribe { (vc, _) in
                vc.viewModel.newData()
            }
            .disposed(by: disposeBag)
        
        output.searchText
            .withUnretained(self)
            .subscribe { (vc, value) in
                print("======\(value)")
                vc.viewModel.filterData(query: value)
            }
            .disposed(by: disposeBag)

        
    }
}

extension SubjectViewController{
    func asyncSubject(){
        // MARK: next로 전달을 해봐도 completed 이벤트로 전달이 되어야 실행되는데, 그렇지 않으면 안된다.
        // MARK: 한줄 요약 - 최후의 변론 한마디만 출력한다.
        async.onNext(100)
        async.onNext(200)
        async.onNext(300)
        async.onNext(400)
        async.onNext(500)
        
        async
            .subscribe { value in
                print("async - \(value)")
            } onError: { error in
                print("async - \(error)")
            } onCompleted: {
                print("async completed")
            } onDisposed: {
                print("async disposed")
            }
            .disposed(by: disposeBag)
        
        async.onNext(3)
        async.onNext(4)
        async.on(.next(5))
        
//        async.onCompleted()
        
        async.onNext(6)
        async.onNext(7)
    }
    func replaySubject(){
        // MARK: buffersize - 메모리에 갖게 된다. array, image
        replay.onNext(100)
        replay.onNext(200)
        replay.onNext(300)
        replay.onNext(400)
        replay.onNext(500)
        
        replay
            .subscribe { value in
                print("replay - \(value)")
            } onError: { error in
                print("replay - \(error)")
            } onCompleted: {
                print("replay completed")
            } onDisposed: {
                print("replay disposed")
            }
            .disposed(by: disposeBag)
        
        replay.onNext(3)
        replay.onNext(4)
        replay.on(.next(5))
        
        replay.onCompleted()
        
        replay.onNext(6)
        replay.onNext(7)
    }
    func behaviorSubject(){
        // MARK: 구독 전 가장 최근 값을 같이 emit해준다. 가장 앞에 있는 값만 의미있다. 더미데이터를 먼저 보여준다던지, 뷰에 먼저 데이터를 보여준다던지, 이런 것들을 생각했을 때 behaivor를 쓰는 빈도도 꽤 있다. 플레이스홀더와 같이
        
        behavior.onNext(1)
        behavior.onNext(200)
        
        behavior
            .subscribe { value in
                print("behavior - \(value)")
            } onError: { error in
                print("behavior - \(error)")
            } onCompleted: {
                print("behavior completed")
            } onDisposed: {
                print("behavior disposed")
            }
            .disposed(by: disposeBag)
        
        behavior.onNext(3)
        behavior.onNext(4)
        behavior.on(.next(5))
        behavior.onNext(6)

        behavior.onCompleted()
        
        behavior.onNext(7)
    }
    func publishSubject(){
        // MARK: 왜 1,2는 출력되지 않고, 3-5까지만 나올까? 구독전이라서 그렇다. 구독이후 3-5까지만 출력된다.
        // MARK: 초기값이 없는 빈상태, subscribe 전 /error/completed notification 이후 이벤트 무시, subscribe 후에 대한 이벤트 다 처리
        
        publish.onNext(1)
        publish.onNext(2)
        
        publish
            .subscribe { value in
                print("publish - \(value)")
            } onError: { error in
                print("publish - \(error)")
            } onCompleted: {
                print("publish completed")
            } onDisposed: {
                print("publish disposed")
            }
            .disposed(by: disposeBag)
        
        publish.onNext(3)
        publish.onNext(4)
        publish.on(.next(5))
        
        publish.onCompleted()
    }
}
