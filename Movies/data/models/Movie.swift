import Foundation
import ObjectMapper

class Movie: NSObject, Mappable {
   
    
    var poster: UIImage?
    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var posterUrl: String?
    var imdRating: String?
    var imdbId: String?
    var type: String?
    
    
    override init() {
        
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.title <- map["Title"]
        self.type <- map["Type"]
        self.year <- map["Year"]
        self.released <- map["Released"]
        self.runtime <- map["Runtime"]
        self.genre <- map["Genre"]
        self.director <- map["Director"]
        self.writer <- map["Writer"]
        self.actors <- map["Actors"]
        self.plot <- map["Plot"]
        self.language <- map["Language"]
        self.country <- map["Country"]
        self.awards <- map["Awards"]
        self.posterUrl <- map["Poster"]
        self.imdRating <- map["imdbRating"]
        self.imdbId <- map["imdbID"]
    }
}
