
import Foundation
class MovieDataBaseRepository: MovieRepositoryProtocol {
    func search(keyWord: String, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?) {
        
    }
    
    func get(identifier: String, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        
    }
    
    func getAll(onDone: ((RepositoryResponse<[Movie]>) -> ())?) {
        
    }
    
    func update(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        
    }
    
    
    
}
