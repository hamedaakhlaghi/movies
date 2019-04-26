import Foundation
import Alamofire
import ObjectMapper
import UIKit

class MovieRestRepository: MovieRepositoryProtocol {
    func getPoster(movie: Movie, onDone: ((RepositoryResponse<UIImage>) -> ())?) {
        
    }
    
   
    func search(keyWord: String, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?) {
        var queryItems = [URLQueryItem]()
        let keyWordQueryItem = URLQueryItem(name: "s", value: "\(keyWord)")
        queryItems.append(keyWordQueryItem)
        let apiKeyQueryItem = URLQueryItem(name: "apikey", value: "d06f0e3d")
        queryItems.append(apiKeyQueryItem)
        let urlComponents = ApiHelper.newUrlComponentsInstance(baseUrl: ApiHelper.movieDataBaseUrl)
        
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print(url)
        ApiHelper.instance.alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseObject { (response: DataResponse<MovieSearchResult>) in
            if response.error != nil {
                onDone?(RepositoryResponse(error: response.error))
                return
            }
            onDone?(RepositoryResponse(value: response.value, restDataResponse: response))
        }
    }
    
    func get(identifier: String, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        
    }
    
    func getAll(onDone: ((RepositoryResponse<[Movie]>) -> ())?) {
        
    }
    
    func update(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        
    }
}





