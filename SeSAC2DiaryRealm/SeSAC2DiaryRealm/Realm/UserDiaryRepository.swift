import Foundation
import RealmSwift


protocol UserDiaryRepositoryType { // 이렇게 채택을 후행에 하니까 어떤 것을 필요로 하고 앞으로 이내용이 있음을 확인할 수 있구나.
    func fetch() -> Results<UserDiary>
    func fetchSort(_ sort: String) -> Results<UserDiary>
    func fetchFilter() -> Results<UserDiary>
    func updateFavorite(item: UserDiary)
    func deleteItem(item: UserDiary)
    func addItem(item: UserDiary)
    func fetchDate(date: Date) -> Results<UserDiary>
    
}

class UserDiaryRepository: UserDiaryRepositoryType {
    func fetchDate(date: Date) -> Results<UserDiary> {
        
        return localRealm.objects(UserDiary.self).filter("diary >= %@ AND diaryDate <= %@", date, Date(timeInterval: 86400, since: date)) //NSPredicate
    }
    
    
    func addItem(item: UserDiary) {
        
    }
    
    
    let localRealm = try! Realm() // userDiaryRepository의 localRealm은 Realm자체가 구조체라서 다른 뷰컨에서 호출을 해도 다 한곳을 바라보고 있다!!
    
    func fetch() -> Results<UserDiary> {
        //Realm 3. Realm 데이터를 정렬해 tasks 에 담기
        return localRealm.objects(UserDiary.self).sorted(byKeyPath: "diaryTitle", ascending: true)
    }
    
    func fetchSort(_ sort: String) -> Results<UserDiary> {
        //Realm 3. Realm 데이터를 정렬해 tasks 에 담기
        return localRealm.objects(UserDiary.self).sorted(byKeyPath: sort, ascending: true)
    }
    
    func fetchFilter() -> Results<UserDiary> {
        //Realm 3. Realm 데이터를 정렬해 tasks 에 담기
        return localRealm.objects(UserDiary.self).filter("diaryTitle CONTAINS[c] 'a'")
    }
    
    func updateFavorite(item: UserDiary){
        try! localRealm.write {
            // 하나의 레코드에서 하나의 특정 레코드만 변환
//            item.favorite = !item.favorite
            item.favorite.toggle()
            print("realm update succed, reload Rows 필요")
        }
    }
    
    func deleteItem(item: UserDiary){

        try! localRealm.write{
            localRealm.delete(item)
        }
        
        removeImageFromDocument(filename: "\(item.objectID).jpg") // filemanager에 있는 애를 데려옴.

    }
    
    func removeImageFromDocument(filename: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } // document 경로를 가져올 수 있따.
        // ex) file:///Users/joobanglee/Library/Developer/CoreSimulator/Devices/EE7FB4FC-8C3C-477D-BE12-92617771247F/data/Containers/Data/Application/1A88C18A-E6C7-41A1-800C-0A5E2419A6C8/Documents/ 여기까지 보여준당
        let fileURL = documentDirectory.appendingPathComponent(filename) // 세부파일 경로, 이미지를 저장할 위치가 된다.
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch let error {
            print(error)
        }
    }
    
    
    
}
