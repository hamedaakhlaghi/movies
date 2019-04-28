import Foundation
import UIKit
class MoviePresenter: MoviePresenterProtocol{
    
    unowned let view: MovieViewProtocol
    
    required init(view: MovieViewProtocol) {
        self.view = view
    }
    
    func getFullMovieData(movie: Movie) {
        let movieRepository = MovieRepository()
        
        let onDataResponse : ((RepositoryResponse<Movie>) -> ()) = { [weak self] response in
            if response.error != nil {
                print("error")
            }
            else {
                let movie = response.value
                self!.view.setFullMovieData(movie: movie!)
            }
        }
        movieRepository.get(movie, onDone: onDataResponse)
    }
    
}
