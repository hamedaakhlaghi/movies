import Foundation
import Alamofire
import ObjectMapper
import UIKit

class MovieRestRepository: MovieRepositoryProtocol {
    
    func search(keyWord: String, page: Int, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?) {
        var queryItems = [URLQueryItem]()
        let keyWordQueryItem = URLQueryItem(name: "s", value: "\(keyWord)")
        queryItems.append(keyWordQueryItem)
        let apiKeyQueryItem = URLQueryItem(name: "apikey", value: "d06f0e3d")
        queryItems.append(apiKeyQueryItem)
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        queryItems.append(pageQueryItem)
        let urlComponents = ApiHelper.newUrlComponentsInstance(baseUrl: ApiHelper.movieDataBaseUrl)
        
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print(url)
        ApiHelper.instance.alamofire.request(request).responseObject { (response: DataResponse<MovieSearchResult>) in
            if response.error != nil {
                onDone?(RepositoryResponse(error: response.error))
                return
            }
            onDone?(RepositoryResponse(value: response.value, restDataResponse: response))
        }
    }
    
    func get(_ movie: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        var queryItems = [URLQueryItem]()
        let keyWordQueryItem = URLQueryItem(name: "i", value: "\(movie.imdbId!)")
        queryItems.append(keyWordQueryItem)
        let apiKeyQueryItem = URLQueryItem(name: "apikey", value: "d06f0e3d")
        queryItems.append(apiKeyQueryItem)
        let plotQueryItem = URLQueryItem(name: "plot", value: "full")
        queryItems.append(plotQueryItem)
        let urlComponents = ApiHelper.newUrlComponentsInstance(baseUrl: ApiHelper.movieDataBaseUrl)
        
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print(url)
        ApiHelper.instance.alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseObject { (response: DataResponse<Movie>) in
            if response.error != nil {
                onDone?(RepositoryResponse(error: response.error))
                return
            }
            onDone?(RepositoryResponse(value: response.value, restDataResponse: response))
        }
    }
    
    func getAll(onDone: ((RepositoryResponse<[Movie]>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))
    }
    
    func update(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))
    }
}





