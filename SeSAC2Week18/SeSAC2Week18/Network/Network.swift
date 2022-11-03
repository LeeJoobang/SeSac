//
//  Network.swift
//  SeSAC2Week18
//
//  Created by Jooyoung Lee on 2022/11/03.
//

import Foundation
import Alamofire

final class Network {
    static let shared = Network()
    
    private init() {}
    
    // MARK: 제네릭을 사용해 반복된 구문을 해결함. 매우 중요.
    func requestSeSAC<T: Decodable>(type: T.Type = T.self, url: URL, method: HTTPMethod = .get, parameters: [String:String]? = nil, headers: HTTPHeaders, completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers)
            .responseDecodable(of: T.self) { response in
                
            switch response.result {
                
            case .success(let data):
                completion(.success(data))//탈출클로져, Result, enum, 연관값...
            case .failure(_):
                
                guard let statusCode = response.response?.statusCode else { return }
                guard let error = SeSACError(rawValue: statusCode) else { return }
                
                completion(.failure(error))
                
            }
        }
    }
    
}
