import Foundation

import Alamofire
import SwiftyJSON

/*
 https://developers.themoviedb.org/3/tv-seasons/get-tv-season-details
 */

class TMDBAPIManager {
    
    static let shared = TMDBAPIManager()
    
    private init() { }
    
    let tvList = [
        ("환혼", 135157),
        ("이상한 변호사 우영우", 197067),
        ("인사이더", 135655),
        ("미스터 션사인", 75820),
        ("스카이 캐슬", 84327),
        ("사랑의 불시착", 94796),
        ("이태원 클라스", 96162),
        ("호텔 델루나", 90447)
    ]
    
    let imageURL = "https://image.tmdb.org/t/p/w500"
     
    // still_path를 가져올 것이다.
    
    func callRequest(query: Int, completionHandler: @escaping ([String])->()) {
        let url = "https://api.themoviedb.org/3/tv/\(query)/season/1?api_key=\(APIKey.tmdb)&language=ko-KR"
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                // still_path 만 추출하자.
//                let stillPath = json["episodes"]["guest_stars"].filter($0["still_path"])
                
                var stillArray: [String] = []
                
                for list in json["episodes"].arrayValue {
                    let value = list["still_path"].stringValue
                    stillArray.append(value)
                    
                }
                //                print(stillArray) // print vs. dump
                let value = json["episodes"].arrayValue.map { $0["still_path"].stringValue }
                completionHandler(value)
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestImage(completionHandler: @escaping ([[String]]) -> ()) {
        
        var posterList: [[String]] = []
        
        //나중에 배울 것: async/await(iOS 13이상)
        TMDBAPIManager.shared.callRequest(query: tvList[0].1) { value in
            posterList.append(value)

            TMDBAPIManager.shared.callRequest(query: self.tvList[1].1) { value in
                posterList.append(value)

                TMDBAPIManager.shared.callRequest(query: self.tvList[2].1) { value in
                    posterList.append(value)
                   
                    TMDBAPIManager.shared.callRequest(query: self.tvList[3].1) { value in
                        posterList.append(value)
                     
                        TMDBAPIManager.shared.callRequest(query: self.tvList[4].1) { value in
                            posterList.append(value)
                           
                            TMDBAPIManager.shared.callRequest(query: self.tvList[5].1) { value in
                                posterList.append(value)
                                
                                TMDBAPIManager.shared.callRequest(query: self.tvList[6].1) { value in
                                    posterList.append(value)
                                    
                                    TMDBAPIManager.shared.callRequest(query: self.tvList[7].1) { value in
                                        posterList.append(value)
                                        completionHandler(posterList)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}


//    func requestEpisodeImage() { // 내용은 기억하자.
//
//        //어떤 문제가 생길가?
//        // 1. 순서 보장, 2. 언제끝날지 모름. 3. 차단당할 수 있다. limit(ex. 1s - 5번 block) => 다음주에 해결해보자.
//
////        for item in tvList {
////            TMDBAPIManager.shared.callRequest(query: item.1) { stillPath in
////                print(stillPath)
////            }
////        }
//
//        let id = tvList[7].1// 90447, 튜플에서 dot syntax를 통해서 가져올 수 있다. array 에서는
//        // 응답이 오면 보내고 응답이 오면 하자.
//
//        TMDBAPIManager.shared.callRequest(query: id) { stillPath in
//            print(stillPath)
//
//            TMDBAPIManager.shared.callRequest(query: self.tvList[5].1) { stillPath in
//                print(stillPath)
//            }
//        }
//    }
