import Foundation
class SearchMoviesPresenter: SearchMoviesPresenterProtokol{
    
    unowned let view: SearchMoviesViewProtocol
    
    required init(view: SearchMoviesViewProtocol) {
        self.view = view
    }
}
