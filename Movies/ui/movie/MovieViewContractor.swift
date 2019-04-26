import Foundation

protocol MovieViewProtocol: class {
    func setFullMovieData(movie: Movie)
}



protocol MoviePresenterProtocol {
    init(view: MovieViewProtocol)
    func getFullMovieData(movie: Movie)
}
