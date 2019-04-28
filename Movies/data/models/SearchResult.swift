import Foundation
import ObjectMapper

class MovieSearchResult: NSObject, Mappable {
    
    var movies: [Movie]?
    
    required init?(map: Map) {
    }
    
    
    func mapping(map: Map) {
        self.movies <- map["Search"]
    }
}
