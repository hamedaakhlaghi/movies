import Foundation
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
//                if response.value?.count == 0 {
//                    //NO res
//                }
//                else if response.value != nil{
//                    print(response.value?.count)
//                }
            }
        }
        movieRepository.search(keyWord: keyWord, onDone: onDataResponse)
    }
}
