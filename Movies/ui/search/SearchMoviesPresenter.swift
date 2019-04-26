import Foundation
import UIKit
class SearchMoviesPresenter: SearchMoviesPresenterProtokol{
    
    unowned let view: SearchMoviesViewProtocol
    
    required init(view: SearchMoviesViewProtocol) {
        self.view = view
    }
    
    func search(keyWord: String) {
        let movieRepository = MovieRepository()
        
        let onDataResponse : ((RepositoryResponse<MovieSearchResult>) -> ()) = { [weak self] response in
            if response.error != nil {
                print("error")
            }
            else {
                let movies = response.value?.movies ?? [Movie]()
                if movies.count > 0 {
                    self?.view.hideNoResult()
                } else {
                    self?.view.showNoResult()
                }
                self!.view.setMovies(movies: movies)
            }
        }
        movieRepository.search(keyWord: keyWord, onDone: onDataResponse)
    }
}
