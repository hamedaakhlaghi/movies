import Foundation

class MovieRepository: MovieRepositoryProtocol {
    
    private let restRepo = MovieRestRepository()
    private let movieDBRepo = MovieDataBaseRepository()
    
    func get(identifier: String, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))

    }
    
    func getAll(onDone: ((RepositoryResponse<[Movie]>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))

    }
    
    func update(_: Movie, onDone: ((RepositoryResponse<Movie>) -> ())?) {
        onDone?(RepositoryResponse(error: UnsupportedOperationException()))

    }
    
    func search(keyWord: String, onDone: ((RepositoryResponse<MovieSearchResult>) -> ())?) {
        restRepo.search(keyWord: keyWord, onDone: onDone)
    }
}
