import Foundation
import RxSwift
import RxCocoa


//associated type == generic

protocol CommonViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output {
        
    }
}

struct Contact{
    var name: String
    var age: Int
    var number: String
}



class SubjectViewModel: CommonViewModel {
    
    
    var contactData = [
        Contact(name: "jack", age: 23, number: "01022332233"),
        Contact(name: "cha", age: 33, number: "01022332234"),
        Contact(name: "lee", age: 43, number: "01022332235")
    ]
    
    var list = PublishSubject<[Contact]>()
    
    func fetchData(){
        list.onNext(contactData)
        
    }
    
    func resetData(){
        list.onNext([])
        
    }
    
    var test = ["Sddd", "dfasd"]
    
    func newData(){
        let new = Contact(name: "고래밥", age: Int.random(in: 10...50), number: "")
        
        contactData.append(new)
        
        list.onNext(contactData) // fetchdata와 크게 다르진 않다.
        
        test = ["1", "3"]
    }
    
    func filterData(query: String){
        let result = query != "" ? contactData.filter { $0.name.contains(query)} : contactData
        list.onNext(result)
    }
    
    //
    
    struct Input{
        let addTap: ControlEvent<Void>
        let resetTap: ControlEvent<Void>
        let newTap: ControlEvent<Void>
        let searchText: ControlEvent<String?>

    }
    
    struct Output{
        let addTap: ControlEvent<Void>
        let resetTap: ControlEvent<Void>
        let newTap: ControlEvent<Void>
        let list: Driver<[Contact]>
        let searchText: Observable<String>
    }

    func transform(input: Input) -> Output {
        let list = list.asDriver(onErrorJustReturn: [])
        
        let text = input.searchText
            .orEmpty // vc -> vm(input)
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance) // wait
            .distinctUntilChanged() // 같은 값을 받지 않음
        return Output(addTap: input.addTap, resetTap: input.resetTap, newTap: input.newTap, list: list, searchText: text)
    }
    
    
    
    
    
}
