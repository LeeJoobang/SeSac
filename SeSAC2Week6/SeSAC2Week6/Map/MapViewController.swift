import UIKit
import MapKit

// Location1. import
import CoreLocation

/*
 mapview
    1. 지도와 위치 권한은 상관 없음
    2. 만약 지도에 현재 위치 등을 표현하고 싶다며 상관 있음.
    3. 중심과 범위 지정이 요구된다.
    4. 핀(anotation)
 */

/*
 권한: 반영이 조금씩 느릴 수 있음. 지웠다고 실행한다고 하더라도.
 설정: 앱이 바로 안뜨는 경우도 있을 수 있음. 뜨시는 분들은 설정 쪽에서 다음 번에 묻기로 변경
 */

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    // Location2. 위치에 대한 대부분을 담당
    let loctionManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //location3. 프로토콜 등록
        loctionManager.delegate = self

//        checkUserDeviceLocationServiceAuthorization() 제거 가능한 이유 학실히 알기

        let center = CLLocationCoordinate2D(latitude: 37.546632, longitude: 126.949819)
        setRegionAndAnnotation(center: center)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showRequestLocationServiceAlert()
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D){
        //지도 중심 설정: 애플 맵 활용해 좌표 복사(청년취업사관학교 기점으로 확인하였다.)
        //37.546632, 126.949819
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
        //핀 - 지도범위 따로이다.
        
        // 지도에 핀 추가
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "이곳이 나의 캠퍼스다."
        
        mapView.addAnnotation(annotation) // 하나만

    }
    
}
// 위치에 관련된 user defined 메서드
extension MapViewController {
    
    // location 7. iOS 버전에 따른 분기 처리 및 iOS 위치 서비스 활성화 여부 확인
    // 위치 서비스가 켜져 있다면 권한을 요청하고, 꺼져 있다면 커스텀 얼럿으로 상황 알려주기
    // CLAuthorizationStatus
    //- denied: 허용 안함 / 설정에서 추후 거부 / 위치 서비스 중지 / 비행기 모드
    //- restricted: 앱 권한 자체 없는 경우 / 자녀 보호 기능 같은 것으로 아예 제한
    func checkUserDeviceLocationServiceAuthorization(){ // 위치서비스 켜져있는 것 확인
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {// ios 14이상이라면
            // 인스턴스를 통해  locationmanager가 가지고 있는 상태를 가져옴.
            authorizationStatus = loctionManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        // ios 위치 서비스 활성화 여부 체크
        
        if CLLocationManager.locationServicesEnabled() {
            // 위치 서비스가 활성화 되어 있으므로, 위치 권한 요청 가능해서 위치 권한을 요청하게 됩니다.
            checkUserCurrentLocationAuthorization(authorizationStatus)
        } else {
            print("위치 서비스가 꺼져 있어서 위치 관련 요청을 못합니다.")
        }
    }
    
    // location8. 사용자의 위치 권한 상태 확인
    // 사용자가 위치를 허용했는지, 거부했는지 아직 선택하지 않았는지 등을 확인(단, 사전에 ios위치 서비스 활성화 꼭 확인)
    func checkUserCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            print("NOTDETERMINDED")
            
            loctionManager.desiredAccuracy = kCLLocationAccuracyBest
            loctionManager.requestWhenInUseAuthorization() // 앱을 사용하는 동안에 대한 위치 권한 요청
            // plist wheninuse -> request method ok
            // loctionManager.startUpdatingLocation()
        case .restricted, .denied:
            print("DENIED, 아이폰 설정으로 유도")
            
        case .authorizedWhenInUse:
            print("WHEN IN USE")
            //사용자가 위치를 허용해둔 상태라면, startUpdatingLocation을 통해 didUpdateLocations 메서드를 실행
            loctionManager.startUpdatingLocation()
        default: print("DEFAULT")
        }
    }
    
    
    /*
    Location Authorization Custom Alert
     */
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
          // 설정까지 이동하거나 설정 세부화면까지 이동하거나
          // 한번도 설정 앱에 들어가지 않았거나, 막 다운 받은 앱이거나 - 설정화면까지
          // 앱 목록까지 받을 떄 설정 세부화면까지
          if let appSetting = URL(string: UIApplication.openSettingsURLString){
              UIApplication.shared.open(appSetting)
          }
                
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }

    
}


// Location 4. 프로토콜 선언
extension MapViewController: CLLocationManagerDelegate {
    
    //location 5. 사용자의 위치를 성공적으로 가져온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function, locations)
        
        // ex. 위도, 경도 기반으로 날씨 정보를 조회
        // ex. 지도를 다시 세팅
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
        
        // 위치 업데이트 멈춰
        loctionManager.stopUpdatingLocation()
    }
    
    //location 6. 사용자의 위치를 못 가져온 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
    
    //location9. 사용자의 권한 상태가 바뀔 때 알려줌
    // 거부했다가 설정해서 변경했거나,혹은 notDetermined에서 허용을 했거나 등
    // 허용했어서 위치를 가지고 있는 중에, 다시 위치를 거부하고 온다면??
    // 이럴 때 locationManagerDidChangeAuthorization 메서드를 사용한다.
    
    // ios 14이상: 사용자의 권한 상태가 변경이 될 때, 위치 관리자 생성할 때 호출됨.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkUserDeviceLocationServiceAuthorization()
    }
    
    // ios 14미만:
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("")
    }
    

    
}

extension MapViewController: MKMapViewDelegate {
    
    // 지도에 커스텀 핀을 추가
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        <#code#>
//    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        loctionManager.startUpdatingLocation()
    }
}

