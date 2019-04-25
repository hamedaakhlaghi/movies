import Foundation

protocol SearchMoviesViewProtocol: class {
}


protocol SearchMoviesPresenterProtokol {
    init(view: SearchMoviesViewProtocol)
    func search(keyWord: String)
}
