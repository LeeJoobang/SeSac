import Foundation
import RxSwift
import RxCocoa

struct Contact{
    var name: String
    var age: Int
    var number: String
}

class SubjectViewModel {
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

    
    
    
    
}
