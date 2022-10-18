import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class SampleCollectionViewController: UICollectionViewController {

    var tasks: Results<Todo>!
    let localRealm = try! Realm()
    
    var cellRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, Todo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tasks = localRealm.objects(Todo.self)
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        collectionView.collectionViewLayout = layout
        
        cellRegisteration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = cell.defaultContentConfiguration()
            content.image = itemIdentifier.importance < 3 ? UIImage(systemName: "person.fill") : UIImage(systemName: "person.2.fill"
            )
            content.text = itemIdentifier.title
            content.secondaryText = "\(itemIdentifier.detail.count)개의 세부"
            cell.contentConfiguration = content
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tasks[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    

//        var test: Fruit = Apple()
//        test = Banana()
//        test = Strawberry()
//        return cell
//
//    }
    
}

//class Food {
//
//}
//
//protocol Fruit {
//
//}
//
//class Apple: Food, Fruit {
//
//}
//
//
//class Banana: Food, Fruit {
//
//}
//
//class Melon: Fruit {
//
//}
//
//class Strawberry: Fruit {
//
//}
//
