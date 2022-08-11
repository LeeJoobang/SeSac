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

//    func researchTMDB() {
//        let url = "\(EndPoint.tmdbURL)\(APIKey.APIKey)"
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                //                print("JSON: \(json)")
//                for item in json["results"].arrayValue{
//                    self.movieList.updateValue(item["id"].stringValue, forKey:  item["title"].stringValue)
//                    self.movieIdList.append(item["id"].stringValue)
//                }
//                print(self.movieIdList)
//                print(self.movieList)
////                                dump(TMDBAPIManager.movieList)
////                completionHandler(self.movieList)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func callRequest(query: Int, completionHandler: @escaping([String]) -> ()) {
        
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
    
    func requestImage(completionHandler: @escaping ([[String]]) -> ()) {
        
        
        var posterList: [[String]] = []
        
        TMDBAPIManager.shared.callRequest(query: movieList[0].1) { value in
            posterList.append(value)
            
            TMDBAPIManager.shared.callRequest(query: self.movieList[1].1) { value in
                posterList.append(value)
                
                TMDBAPIManager.shared.callRequest(query: self.movieList[2].1) { value in
                    posterList.append(value)
                    
                    TMDBAPIManager.shared.callRequest(query: self.movieList[3].1) { value in
                        posterList.append(value)
                        
                        TMDBAPIManager.shared.callRequest(query: self.movieList[4].1) { value in
                            posterList.append(value)
                            completionHandler(posterList)
                            
                        }
                    }
                }
            }
        }
        
        
        
    }
    
    
}
