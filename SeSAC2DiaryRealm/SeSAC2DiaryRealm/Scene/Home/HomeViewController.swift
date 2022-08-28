import UIKit
import SnapKit
import RealmSwift //Realm 1. import
import FSCalendar

class HomeViewController: BaseViewController{
    
//    var a: String? // 나중에 초기화해도 된다.
//    let localRealm = try! Realm() // Realm 2. => UserDiaryRepository 여기에 넣었다.
    
    let repository = UserDiaryRepository()
    
    lazy var calender: FSCalendar = {
       let view = FSCalendar()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var tableView: UITableView = { // 지연저장을 해서 delegate, datasource를 내부적으로 사용할 수 있다.
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        view.rowHeight = 100
        
        return view
    }() // 즉시 실행 클로져
    
    let formatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        return formatter
    }()
    
    var tasks: Results<UserDiary>! {
        didSet{
            //화면 갱신은 화면 전환 코드 및 생명주기 실행 점검 필요
            tableView.reloadData()
            print("Tasks Changed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDocumentZipFile()
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRealm()
    }
    
    func fetchRealm(){ // UserDiaryRepository 에서 가져온다.
        //Realm 3. Realm 데이터를 정렬해 tasks 에 담기
//        tasks = repository.localRealm.objects(UserDiary.self).sorted(byKeyPath: "diaryTitle", ascending: true)
        tasks = repository.fetch()
    }
    
    override func configure(){
        view.addSubview(tableView)
        view.addSubview(calender)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        
        let sortButton = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonClicked))
        let filterButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterButtonClicked))
        
        let backupButton = UIBarButtonItem(title: "백업", style: .plain, target: self, action: #selector(backupButtonClicked))
        
        let jackbackupbutton = UIBarButtonItem(title: "잭님백업", style: .plain, target: self, action: #selector(jackbackupButtonClicked))
        navigationItem.leftBarButtonItems = [sortButton, filterButton, backupButton, jackbackupbutton]

       
    }
    
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.bottom.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.topMargin.equalTo(300)
        }
        
        calender.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
    }
    
    @objc func jackbackupButtonClicked() {
        let vc = ViewController()
        transition(vc, transitionStyle: .push)
    }
    
    @objc func backupButtonClicked() {
        let vc = BackupViewContoller()
        transition(vc, transitionStyle: .push)
    }
    @objc func plusButtonClicked() { // 익스텐션 - 트랜지션뷰컨을 만들었다. 그것을 사용해보자.
        let vc = WriteViewController()
        transition(vc, transitionStyle: .presentFullNavigation)
    }
    
    @objc func sortButtonClicked(){
        tasks = repository.fetchSort("regdate")
    }
    
    // realm filter query, NSPredicate
    @objc func filterButtonClicked(){
        tasks = repository.fetchFilter()
        ///.("diaryTitle = 오늘의 일기 171")
    }
    
//    func loadImageFromDocument(filename: String) -> UIImage? {
//        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } // document 경로를 가져올 수 있따.
//        // ex) file:///Users/joobanglee/Library/Developer/CoreSimulator/Devices/EE7FB4FC-8C3C-477D-BE12-92617771247F/data/Containers/Data/Application/1A88C18A-E6C7-41A1-800C-0A5E2419A6C8/Documents/ 여기까지 보여준당
//        let fileURL = documentDirectory.appendingPathComponent(filename) // 세부파일 경로, 이미지를 저장할 위치가 된다.
//        
//        if FileManager.default.fileExists(atPath: fileURL.path) {
//            return UIImage(contentsOfFile: fileURL.path)
//        } else {
//            return UIImage(systemName: "star.fill")
//        }
////            
////        let image = UIImage(contentsOfFile: fileURL.path)
////        return image
//    }
//    
//    func removeImageFromDocument(filename: String) {
//        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } // document 경로를 가져올 수 있따.
//        // ex) file:///Users/joobanglee/Library/Developer/CoreSimulator/Devices/EE7FB4FC-8C3C-477D-BE12-92617771247F/data/Containers/Data/Application/1A88C18A-E6C7-41A1-800C-0A5E2419A6C8/Documents/ 여기까지 보여준당
//        let fileURL = documentDirectory.appendingPathComponent(filename) // 세부파일 경로, 이미지를 저장할 위치가 된다.
//        
//        do {
//            try FileManager.default.removeItem(at: fileURL)
//        } catch let error {
//            print(error)
//        }
//    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeTableViewCell else { return UITableViewCell() }
        
        cell.diaryImageView.image = loadImageFromDocument(filename: "\(tasks[indexPath.row].objectID).jpg")
        
        cell.setData(data: tasks[indexPath.row])
        return cell
    }
    
    // 참고. tableView editing mode
    // 테이블 뷰 높이가 작을 경우, 이미지가 없을 대 시스템 이미지가 아닌 경우
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
            self.repository.updateFavorite(item: self.tasks[indexPath.row])
            self.fetchRealm()
        }
            // realm data update
//            try! self.localRealm.write {
//                // 하나의 레코드에서 하나의 특정 레코드만 변환
//                self.tasks[indexPath.row].favorite = !self.tasks[indexPath.row].favorite
//                print("realm update succed, reload Rows 필요")
                
                // 하나의 테이블에 특정 컬럼 전체 값을 변경
//                self.tasks.setValue(true, forKey: "favorite")
                
                // 하나의 레코드에서 여러 컬럼들이 변경
//                self.localRealm.create(UserDiary.self, value: ["objectID" : self.tasks[indexPath.row].objectID, "diaryContent" : "변경테스트", "diaryTitle" : "제목임"], update: .modified)
//            }
            // 1. 스와이프한 셀 하나만 reloadrows  코드 구현
            // 2. 데이터가 변경되었으니 다시 realm에서 데이터 가지고 오기 => didset일관적 형태로 갱신
            
           
        
        let image = tasks[indexPath.row].favorite ? "star.fill" : "star"
        favorite.image = UIImage(systemName: image)
        favorite.backgroundColor = .systemPink

        return UISwipeActionsConfiguration(actions: [favorite])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = UIContextualAction(style: .normal, title: "삭제") { action, view, completionHandler in
            
            self.repository.deleteItem(item: self.tasks[indexPath.row])
            
//            self.fetchRealm() // 렘 데이터만 가져오는 것이다.
        }
    

        return UISwipeActionsConfiguration(actions: [favorite])
    }
    
    
}

// 렘저장(이미지 x), 이미지저장(도큐먼트 추가), 이미지 가지고 올 때 경로(확장자)

extension HomeViewController: FSCalendarDelegate, FSCalendarDataSource {
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        return repository.fetchDate(date: date).count
//    }
    
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//         return "새싹"
//    }
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        return UIImage(systemName: "star.fill")
//
//    }
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return formatter.string(from: date) == "220907" ? "오프라인 행사" : nil
    }
    
    // 데이터가 100개가 있다. 렘에 저장된 25일에 저장된
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        tasks = repository.fetchDate(date: date)
//    }
    
}
