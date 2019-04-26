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
                self!.view.setMovies(movies: movies)
            }
        }
        movieRepository.search(keyWord: keyWord, onDone: onDataResponse)
    }
    
//    func getMovieAvatar(movies : [Movie]) {
//        
//        for movie in movies {
//            if let assetUrl = movie.posterUrl {
//                let request = RequestHelper.urlRequest(verb: ConstantHelper.getCustomVerb, url: url)
//                
//                self.apiHelper?.alamofire.request(request).responseImage{ response in
//                    
//                    switch response.response?.statusCode {
//                    case 200?:
//                        let imgPatient = response.result.value!
//                        patient.avatar = imgPatient
//                        let keepSessionAlive = KeepSessionAlive.instance
//                        keepSessionAlive.start()
//                        DispatchQueue.main.async {
//                            self.patientTableView.reloadData()
//                        }
//                        break
//                    default:
//                        patient.avatar = #imageLiteral(resourceName: "noAvatar")
//                        break
//                    }
//                }
//            }
//            else {
//                patient.avatar = #imageLiteral(resourceName: "noAvatar")
//            }
//        }
//    }
}
