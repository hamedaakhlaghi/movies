import Foundation

protocol SearchMoviesViewProtocol: class {
    func setMovies(movies: [Movie])
    func hideNoResult()
    func showNoResult()
}


protocol SearchMoviesPresenterProtokol {
    init(view: SearchMoviesViewProtocol)
    func search(keyWord: String, pageNumber: Int)
}
