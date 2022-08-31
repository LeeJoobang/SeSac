import Foundation

class PersonViewModel {
    var list: Observable<Person> = Observable(Person(page: 0, totalPages: 0, totalResults: 0, results: []))
    
    func fetchPerson(query: String) {
        
        PersonAPIManager.requestPerson(query: query) { person, error in
            guard let person = person else {
                return
            }
            self.list.value = person
        }
    }
    
    
    var numberOfRowsInSection: Int {
        return list.value.results.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> Result { // 어떻게 매개변수로 indexPath를 받아올 수 있지?
        return list.value.results[indexPath.row]
    }
}
