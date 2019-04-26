import Foundation

protocol SearchMoviesViewProtocol: class {
    func setMovies(movies: [Movie])
}


protocol SearchMoviesPresenterProtokol {
    init(view: SearchMoviesViewProtocol)
    func search(keyWord: String)
}
