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

enum SeSACError: Int, Error{
    case invalidAuthorization = 401
    case takenEmail = 406
    case emptyParameters = 501
}

extension SeSACError: LocalizedError{
    
    var errorDescription: String?{
        switch self{
        case .invalidAuthorization:
            return "토큰이 만료되었습니다. 다시 로그인 해주세요."
        case .takenEmail:
            return "이미 가입된 회원입니다. 로그인 해주세요."
        case .emptyParameters:
            return "정보가 없습니다."
        }
    }
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
                UserDefaults.standard.set(data.token, forKey: "token")
                print(data.token)
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

