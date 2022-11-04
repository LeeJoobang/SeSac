import UIKit

final class PersonViewModel {
    
    let person: [Person] = [
        Person(image: UIImage(systemName: "star")!, name: "주영"),
        Person(image: UIImage(systemName: "star.fill")!, name: "고래밥"),
        Person(image: UIImage(systemName: "person")!, name: "수영")
    ]
    
    var personImage: CObservable<UIImage?> = CObservable(nil)
    var name: CObservable<String?> = CObservable(nil)
    
    private var index: Int = 0

    
    init(){
        self.personImage.value = person[index].image
        self.name.value = person[index].name
    }
    
    func clickedButton(){
        index = (index + 1 < person.count) ? index + 1 : 0
        print("데이터 변경")
        self.personImage.value = person[index].image
        self.name.value = person[index].name
        
        
    }
    

}
