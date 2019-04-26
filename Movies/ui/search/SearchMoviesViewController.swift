
import UIKit

class SearchMoviesViewController: BaseViewController,SearchMoviesViewProtocol, UISearchResultsUpdating, UISearchBarDelegate, SearchTableViewDelegate {
    
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var tableSearchResult: UITableView!
    
    var resultSearchController = UISearchController()
    var presenter: SearchMoviesPresenterProtokol?
    var searchResultTableAdapter: SearchResultTableAdapter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchMoviesPresenter(view: self)
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
        presenter?.search(keyWord: searchBar.text ?? "")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func setMovies(movies: [Movie]) {
        initSearchResultTableView(movies: movies)
    }
    
    func initSearchResultTableView(movies: [Movie]) {
        searchResultTableAdapter = SearchResultTableAdapter()
        tableSearchResult.register(UINib(nibName: R.nib.searchResultCellViewController.name, bundle: R.nib.searchResultCellViewController.bundle), forCellReuseIdentifier: R.nib.searchResultCellViewController.identifier)
        tableSearchResult.delegate = searchResultTableAdapter
        tableSearchResult.dataSource = searchResultTableAdapter
        searchResultTableAdapter?.setDelegate(delegate: self)
        searchResultTableAdapter?.setMovies(movies: movies)
        tableSearchResult.reloadData()
    }
    
    func selectedMovie(movie: Movie) {
        
    }
    
}
