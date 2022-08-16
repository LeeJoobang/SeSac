import UIKit

class WalkThroughViewController: UIPageViewController {

    
    //1. 배열 형태로 뷰컨트롤러를 추가한다.
    var pageViewControllerList: [UIViewController] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red // 페이지의 표시 백그라운드가 달라진다.
    
        createPageViewController()
        configurePageViewController()
    }
    
    //2. 배열에 뷰 컨트롤러 추가
    func createPageViewController() {
        let sb = UIStoryboard(name: "WalkThrough", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let vc2 = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let vc3 = sb.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        pageViewControllerList = [vc1, vc2, vc3]
    }
    
    //3. delegate, datasource 연결
    func configurePageViewController() {
        delegate = self
        dataSource = self

        //4. display - 0번 인덱스에 있는지 확인
        guard let first = pageViewControllerList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
}

// 5. extension 추가
extension WalkThroughViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 현재 페이지뷰컨트롤러에 보이는 뷰컨(view controller)의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        
        // 이전 뷰를 보여주기 때문에 현재 뷰 인덱스에서 -1를 해준다.
        let previousIndex = viewControllerIndex - 1 // firstViewController 입장에서 0인데, previous는 -1이 된다. 만약 음수가 되면 nil이 된다.
        
        return previousIndex < 0 ? nil : pageViewControllerList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        
        // 다음 뷰를 보여주기 때문에 현재 뷰 인덱스에서 +1를 해준다.
        let nextIndex = viewControllerIndex + 1 // firstViewController 입장에서 0인데, previous는 -1이 된다. 만약 음수가 되면 nil이 된다.
        return nextIndex >= pageViewControllerList.count ? nil : pageViewControllerList[nextIndex]
    }
    
    //6.  페이지 카운트
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllerList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageViewControllerList.firstIndex(of: first) else { return 0 }
        print(index)
        return index
    }
    
}
