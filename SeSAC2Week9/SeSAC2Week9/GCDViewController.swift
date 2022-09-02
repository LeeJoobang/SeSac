//
//  GCDViewController.swift
//  SeSAC2Week9
//
//  Created by Jooyoung Lee on 2022/09/02.
//

import UIKit

class GCDViewController: UIViewController {
    
    let url1 = URL(string: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg")!
    let url2 = URL(string: "https://apod.nasa.gov/apod/image/2112/M3Leonard_Bartlett_3843.jpg")!
    let url3 = URL(string: "https://apod.nasa.gov/apod/image/2112/LeonardMeteor_Poole_2250.jpg")!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func serialSync(_ sender: UIButton) {
        print("START")
        
        for i in 1...100{
            print(i, terminator: " ")
        }
        
        DispatchQueue.main.sync { // 왜 문제가 생길까? 기다리다보면 무한 대기 상태로 빠질 수도 있다. 교착상태라고 한다.
            for i in 101...200{
                print(i, terminator: " ")
            }
        }
        
        
        print("END")
        
        
    }
    
    @IBAction func serialAsync(_ sender: UIButton) {
        print("START")
        
        DispatchQueue.main.async { // 애는 먼저 안나온다. 왜? 얘는 큐에 먼저 보내놓는다.
            
            for i in 1...100{
                print(i, terminator: " ")
            }
        }
        
        //        for i in 1...100{ // 언제쓸까? 네트워크 통신을 하면 글로벌로 동작하기 때문에 main 쓰레드에서 처리 안된다. 메인으로 돌리고 글로벌 블럭 내에서 메인쓰레드면 바로 진행을 한다. 비동기 + 글로벌 - 네트워크 통신 이후에 화면 전환 이후에
        //            DispatchQueue.main.async {
        //                print(i, terminator: " ")
        //            }
        //        }
        
        for i in 101...200{ // 그리고 이 반복문을 돌게 된다.
            print(i, terminator: " ")
        }
        
        print("END")
        
    }
    
    @IBAction func globalSync(_ sender: UIButton) {
        print("START", terminator: " ")
        
        DispatchQueue.global().sync { // 메인스레드에서 작업을 시키게 된다.
            for i in 1...100{
                print(i, terminator: " ")
                
            }
        }
        
        for i in 101...200{
            print(i, terminator: " ")
        }
        
        print("END")
    }
    
    
    @IBAction func globalAsync(_ sender: UIButton) {
        print("START\(Thread.isMainThread)", terminator: " ")
        
        
        //일을 큐한테 보낸다. 닭벼슬이 다음 일을 하고 보내진 일을 받은 소가 동시에 그 일을 바로 시작한다. 그래서 일이 섞이게 된다.
        // main 쓰레드는 닭벼슬이다.
        
        DispatchQueue.global().async { // 다른 알바생에게 해달라고 했다.
            for i in 1...100{
                print(i, terminator: " ")
            }
        }
        
        //        for i in 1...100{ // 이렇게 구현하면 뒤죽박죽 처리가 된다.
        //            DispatchQueue.global().async {
        //                print(i, terminator: " ")
        //            }
        //        }
        
        for i in 101...200{
            print(i, terminator: " ")
        }
        
        
        
        print("END\(Thread.isMainThread)")
        
    }
    
    
    @IBAction func qos(_ sender: UIButton) { // 글로벌 큐에서는 우선순위를 이와 같이 줄 수 있다.
        
        let cumtomQueue = DispatchQueue(label: "concurrentSeSAC", qos: .userInteractive, attributes: .concurrent)
        
        cumtomQueue.async {
            print("START")
        }
        
        //비동기로 처리하되 동시에 하지 않고 우선순위를 두는 것이다.
        for i in 1...100{// 중요도가 가장 낮음
            DispatchQueue.global(qos: .background).async {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200{// 중요도 가장 높다.
            DispatchQueue.global(qos: .userInteractive).async {
                print(i, terminator: " ")
            }
        }
        
        for i in 201...300{// 중요도 2번째
            DispatchQueue.global(qos: .utility).async {
                print(i, terminator: " ")
            }
        }
    }
    
    
    @IBAction func dispatchGroup(_ sender: UIButton) {
        
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        DispatchQueue.global().async(group: group) {
            for i in 101...200 {
                print(i, terminator: " ")
                
            }
        }
        
        DispatchQueue.global().async(group: group) {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        
        group.notify(queue: .main) {
            print("끝") // tableView.reload
        }
    }
    
    
    func request(url: URL, completionHandler: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHandler(UIImage(systemName: "star"))
                return
            }
            
            let image = UIImage(data: data)
            completionHandler(image)
            
        }.resume()
    }
    
    
    @IBAction func dispatchGroupNASA(_ sender: UIButton) {
        
//        request(url: url1) { image in
//            print("1")
//            self.request(url: self.url2) { image in
//                print("2")
//                self.request(url: self.url3) { image in
//                    print("3")
//                    print("끝. 갱신.")
//                }
//            }
//        }
//      dispatchGroup으로 묶어보자
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            self.request(url: self.url1) { image in
                print("1")
            }
        }
        DispatchQueue.global().async(group: group) {
            self.request(url: self.url2) { image in
                print("2")
            }

        }
        DispatchQueue.global().async(group: group) {
            self.request(url: self.url3) { image in
                print("3")
            }
        }
        
        group.notify(queue: .main) {
            print("끝, 완료")
        }

    }
    
    
    @IBAction func enterLeave(_ sender: UIButton) {
        var imageList: [UIImage] = []
        
        let group = DispatchGroup()
        group.enter()
        request(url: url1) { image in
            print("1")
            imageList.append(image!)
            group.leave()
        }
        
        group.enter()
        request(url: url2) { image in
            print("2")
            imageList.append(image!)

            group.leave()
        }
        
        group.enter()
        request(url: url3) { image in
            print("3")
            imageList.append(image!)

            group.leave()
        }
        
        group.notify(queue: .main) {
            self.image1.image = imageList[0]
            self.image2.image = imageList[1]
            self.image3.image = imageList[2]
            print("끝. 완료.")
        }
    }
    
    
    @IBAction func raceCondition(_ sender: UIButton) {
        
        let group = DispatchGroup()
        var nickName = "SeSAC"
        
        DispatchQueue.global(qos: .userInteractive).async(group: group){
            nickName = "고래밥"
            print("first: \(nickName)")
        }
        
        DispatchQueue.global(qos: .userInteractive).async(group: group){
            nickName = "칙촉"
            print("second: \(nickName)")
        }

        DispatchQueue.global(qos: .userInteractive).async(group: group){
            nickName = "올라프"
            print("third: \(nickName)")
        }
        
        group.notify(queue: .main) {
            print("result: \(nickName)") // 결과가 뭐가 나올지 모르겠다. 일을 나눠서 시켰고, 결과는 랜덤으로 누가 될지 모르지 않은가?
            
        }

        
        
        
        
        
    }
    
}
