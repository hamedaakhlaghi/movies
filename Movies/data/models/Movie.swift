import Foundation
import ObjectMapper

class Movie: Mappable {
    
    public var title: String?
    public var year: String?
    public var rated: String?
    public var released: String?
    public var runtime: String?
    public var genre: String?
    public var director: String?
    public var writer: String?
    public var actors: String?
    public var plot: String?
    public var language: String?
    public var country: String?
    public var awards: String?
    public var posterUrl: String?
    public var imdRating: String?
    public var imdbId: String?
    public var type: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        map.shouldIncludeNilValues = true
        title <- map["Title"]
        type <- map["Type"]
        year <- map["Year"]
        released <- map["Released"]
        runtime <- map["Runtime"]
        genre <- map["Genre"]
        director <- map["Director"]
        writer <- map["Writer"]
        actors <- map["Actors"]
        plot <- map["Plot"]
        language <- map["Language"]
        country <- map["Country"]
        awards <- map["Awards"]
        posterUrl <- map["Poster"]
        imdRating <- map["imdbRating"]
        imdbId <- map["imdbID"]
    }
}
