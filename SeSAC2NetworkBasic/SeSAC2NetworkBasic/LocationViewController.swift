import UIKit // 7.29. 코드 - 뱃지, 노티

class LocationViewController: UIViewController {

    //1. Notification
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // custom font 출력
        for family in UIFont.familyNames {
            print("===========\(family)==============")
            
            for name in UIFont.fontNames(forFamilyName: family){
                print(name)
            }
        }
        
        
        
        
        
        
        requestAuthorization()


    }

    @IBAction func notificationButtonClicked(_ sender: UIButton) {
        sendNotification()
    }
    
    //2. Notification - 권한 요청
    func requestAuthorization(){
        
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            if success { // 성공했을 때, 어떤 내용을 어떻게 보낼지 조건을 입력한다.
                self.sendNotification()
            }
        }
    }
    /*
      3. Notification - 권한허용한 사용자에게 알림 요청(언제? 어떤 컨텐츠로 보낼 것인가?)
      iOS 시스템에서 알림을 담당 > 알림 등록 필요하다.
      현재 앱 아이콘이 비어있다. 에셋에 앱 아이콘을 자동으로 등록하면 된다.
      앱 아이콘 함부러 못바꾼다.
     */
    
    
    /*
     - 권한 허용해야만 알림이 온다.
     - 권한 허용 후 시스템적으로 최초 한번만 뜬다.
     - 허용이 안된 경우 애플 설정으로 직접 유도하는 코드를 구성해야 한다.
     
     - 기본적으로 알림은 포그라운드에서 수신되지 않는다.
     - 로컬 알림에서 60초 이상 반복 가능 / 갯수 제한 64개
     
     1. 뱃지 제거? > 뱃지는 어느 시점에 제거해주는게 좋을까? > 액티브해주면 지운다.
     2. 노티 제거? > 노티의 유효기간? 디폴트 4주정도이다. > 카톡이 다쌓이는데, 노티를 끄면 다 사라지게 된다. > 언제 노티피케이션을 지우는게 맞을까? > 런치스크린 상태에서 지워버린다.
     3. 포그라운드 수신? >  딜리게이트 메서드로 해결
     
     +a(개발자 계정이 있어야 한다.)
      - 노티는 앱 실행이 기본인데, 특정 노티에 따라 클릭 할 때 특정 화면으로 가고 싶다면?
      - 포그라운드 수신 > 특정 화면에서는 안받고, 특정 조건에 대해서만 포그라운드 수신을 하고 싶다면?? (채팅방 기준)
      - iOS 15부터 집중모드, notification 받는데 5가지 우선순위가 있다. 우선순위 기본 기준이 있으니 이것을 제어할 수 있어야한다. typesentive을 우선할 수 없다. 어떤 것들은 일반적인 형태로 두는 것이 맞는지, iOS 15부터 집중모드 생기면서 5-6개의 순위가 있었다. 이런 것들을 처리하는 것이 필요해 긴급한 알림으로 처리할지 세세하게 할 수 있다. 모드 나눠서 쓰는 것을 좋아하는 유저가 있다.
     
     
     */
    func sendNotification(){
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "다마고치를 키워보세요" // 볼드로 표시가 된다.
        notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...100))"
        notificationContent.body = "저는 따끔따끔 다마고치입니다. 배고파요."
        notificationContent.badge = 40
        
        /*
         언제? 1) 시간 간격으로 보낼 수도 있고, 2) 캘린더 기준으로 언제 보내겠다. 3) 위치에 따라 보낼 수 있다.
         시간 간격일 때는 60초 이상일 때 가능하다. 그래서 타임 인터벌을 60으로 하던지, 반복을 폴스하는 것이다.
         */
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // repeats : 사용자가 반복을 할지 말지, false는 반복을 안하겠다. true를 하면 5초마다 반복하는것이다.
        // calender로 만들어보기
        
        /*
         var dateComponents = DateComponents()
         dateComponents.minute = 15
         let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
         */
        
        /*
         알림 요청
         identifier가 왜 필요할까????? 엄청나게 무한으로 쌓이는 경우가 있다. 하나만 있는 경우가 있는데, identifier에 대해 따라 구분된다. 나는 알림이 스택으로 쌓이게 관리하고 싶을 땐, 알림 몇천개가 될때 모르는데, 어떻게 설정할 수 있을가????
         만약 알림 관리 할 필요 x = 알림 클릭하면 앱을 켜주는 정도.
         만약 알림 관리 할 필요 0 -> +1, 고유 이름, 규칙 등
         12개 > 날짜를 찍는다.
         */
        
        let request = UNNotificationRequest(identifier:"jack", content: notificationContent, trigger: trigger)
        notificationCenter.add(request)
        
    }
}
