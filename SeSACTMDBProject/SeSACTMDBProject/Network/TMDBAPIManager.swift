import Foundation
import Alamofire
import SwiftyJSON

class TMDBAPIManager {
    static let shared = TMDBAPIManager()
    
    private init() { }
    
    let imageURL = "https://image.tmdb.org/t/p/w500"
    
    let movieList = [
        ("Jurassic World Dominion", 507086),
        ("Doctor Strange in the Multiverse of Madness", 453395),
        ("Thirteen Lives", 698948),
        ("Minions: The Rise of Gru", 438148),
        ("Luck", 585511)
    ]
    
    let tmdbList: [RecommendMovie] = []
    
    func callRequest(query: String, completionHandler: @escaping([String]) -> ()) {
        let url = "https://api.themoviedb.org/3/movie/\(query)/recommendations?api_key=\(APIKey.APIKey)&language=en-US"
        
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var stillArray: [String] = []
                for item in json["results"].arrayValue{
                    let value = item["poster_path"].stringValue
                    stillArray.append(value)
                }
                completionHandler(stillArray)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestImage(list: [RecommendMovie], completionHandler: @escaping ([[String]]) -> ()) {
        var posterList: [[String]] = []
        // MARK: - dispatchqueue = dispatchGroup - 순서 보장
        // MARK: - section 활용
        for item in 0...list.count - 1 {
            TMDBAPIManager.shared.callRequest(query: list[item].id) { value in
                posterList.append(value)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            completionHandler(posterList)
        })
        

        
    }
}


class Refactoring {
    
    static let shared = Refactoring()
    
    private init() { }
    
    let imageURL = "https://image.tmdb.org/t/p/w500"
    
    func researchTMDB(completionHandler: @escaping([RecommendMovie]) -> ()) {
        
        let testUrl = "\(APIKey.URL)\(APIKey.APIKey)"
        
        AF.request(testUrl, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //                print("JSON: \(json)")
                let list = json["results"].arrayValue.map { RecommendMovie(title: $0["title"].stringValue, id: $0["id"].stringValue, filePath: $0["poster_path"].stringValue)}
                completionHandler(list)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
