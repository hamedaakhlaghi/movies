
import Foundation
import UIKit

protocol SearchTableViewDelegate: class {
    func selectedMovie(movie: Movie)
}

class SearchResultTableAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movie]?
    var searchTableViewDelegate: SearchTableViewDelegate?
    
    func setDelegate(delegate: SearchTableViewDelegate) {
        searchTableViewDelegate = delegate
    }
   
    func setMovies(movies: [Movie]) {
        self.movies = movies
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.searchResultCellViewController.identifier, for: indexPath) as! SearchResultCellViewController
        cell.setMovie(movie: movies![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // move to movie view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
}
