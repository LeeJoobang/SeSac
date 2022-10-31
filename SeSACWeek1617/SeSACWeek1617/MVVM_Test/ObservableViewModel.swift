//import Foundation
//import Alamofire
//
//protocol ObservableViewModelProtocol {
//    func fetchEmployees()
//    func setError(_ message: String)
//    var employees: Observable<[Employee]> { get set } // (1)
//    var errorMessage: Observable<String?> { get set }
//    var error: Observable<Bool> { get set }
//}
//
//class ObservableViewModel: ObservableViewModelProtocol {
//    var errorMessage: Observable<String?> = Observable(nil)
//    var error: Observable<Bool> = Observable(false)
//    
//    var apiManager: APIManager?
//    var employees: Observable<[Employee]> = Observable([]) // (2)
//    
//    init(manager: APIManager = APIManager()) {
//        self.apiManager = manager
//    }
//    
//    func setAPIManager(manager: APIManager) {
//        self.apiManager = manager
//    }
//    
//    func fetchEmployees() {
//        self.apiManager!.getEmployees { (result: DataResponse<EmployeesResponse, AFError>) in
//            switch result.result {
//            case .success(let response):
//                if response.status == "success" {
//                    self.employees = Observable(response.data) // (3)
//                    return
//                }
//                self.setError("에러 메시지")
//            }
//            case .failure:
//                self.setError("에러 메시지")
//        }
//    }
//    
//    func setError(_ message: String) {
//        self.errorMessage = Observable(message)
//        self.error = Observable(true)
//    }
//}
