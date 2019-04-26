import Foundation
import UIKit

class MovieRepository: MovieRepositoryProtocol {
    
    private let restRepo = MovieRestRepository()
    private let movieDBRepo = MovieDataBaseRepository()
    
    func get(_ movie: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        restRepo.get(movie, onDone: onDone)
    }
    
    func getAll(onDone: ((RepositoryResponse<[Movie]>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))

    }
    
    func update(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))

    }
    
    func search(keyWord: String, page: Int, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?) {
        restRepo.search(keyWord: keyWord, page: page, onDone: onDone)
    }
    
}
