
import UIKit

class SearchMoviesViewController: BaseViewController,SearchMoviesViewProtocol, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    var resultSearchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initUIComponents() {
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self
            
            controller.dimsBackgroundDuringPresentation = false
            
            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            self.movieListTableView.tableHeaderView = controller.searchBar
            
            return controller
            
        })()
        
    }
    
    func initListeners() {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
