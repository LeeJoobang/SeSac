import Foundation
import Alamofire

struct Login: Codable {
    let token: String
    
}
struct Profile: Codable{
    let user: User
}

struct User: Codable{
    let photo: String
    let email: String
    let username: String
}

class APIService {
    func signup(){
        let api = SeSACAPI.signUP(username: "testjoo1", email: "testjoo1@testjoo1.com", password: "12345678")
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseString {
            response in
            print(response)
            print(response.response?.statusCode)
        }
    }
    
    func login(){
        let api = SeSACAPI.login(email: "testjoo1@testjoo1.com", password: "12345678")
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Login.self) { response in
            switch response.result{
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
                print("성공")

            case .failure(_):
                print(response.response?.statusCode)
            }
        }

    }
    
    func profile(){
        let api = SeSACAPI.profile
        AF.request(api.url, method: .get, headers: api.headers)
            .responseDecodable(of: Profile.self) { response in
            switch response.result{
            case .success(let data):
                print(data)
                print("성공")
            case .failure(_):
                print("실패")
                print(response.response?.statusCode)
            }
        }

    }
}
