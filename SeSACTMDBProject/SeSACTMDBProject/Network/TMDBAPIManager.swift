import Foundation

import Alamofire
import SwiftyJSON

class TMDBAPIManager {
    static let shared = TMDBAPIManager()
    static var movieList = [String:String]()
    
    let imageURL = "https://image.tmdb.org/t/p/w500"
     
    func callRequest() {
        print(TMDBAPIManager.movieList)

    }
    
        
 
}
