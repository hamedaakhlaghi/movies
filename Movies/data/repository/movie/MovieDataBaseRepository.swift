
import Foundation
import UIKit
class MovieDataBaseRepository: MovieRepositoryProtocol {
    
    
    func search(keyWord: String, page: Int, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))
    }
    
    func get(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        
    }
    
    func getAll(onDone: ((RepositoryResponse<[Movie]>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))
    }
    
    func update(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))
    }
    
}
