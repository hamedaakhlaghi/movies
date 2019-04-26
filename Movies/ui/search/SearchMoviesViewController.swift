
import UIKit
import ESPullToRefresh


class SearchMoviesViewController: BaseViewController,SearchMoviesViewProtocol, UISearchResultsUpdating, UISearchBarDelegate, SearchTableViewDelegate {
    
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var tableSearchResult: UITableView!
    var movies = [Movie]()
    var pageNumber = 1
    @IBOutlet weak var labelNoResult: UILabel!
    var resultSearchController = UISearchController()
    var presenter: SearchMoviesPresenterProtokol?
    var searchResultTableAdapter: SearchResultTableAdapter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchMoviesPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultSearchController.isActive = true
    }
    
    func initUIComponents() {
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.barStyle = UIBarStyle.black
            controller.dimsBackgroundDuringPresentation = false

            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            self.movieListTableView.tableHeaderView = controller.searchBar
            labelNoResult.isHidden = true
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
        presenter?.search(keyWord: searchBar.text ?? "", pageNumber: pageNumber)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.movies.removeAll()
        pageNumber = 1
    }
    
    
    func setMovies(movies: [Movie]) {
        if movies.count == 0 {
//            tableSearchResult.es.noticeNoMoreData()
//            tableSearchResult.es.stopLoadingMore()
        }
        self.movies.append(contentsOf: movies)
        initSearchResultTableView()
    }
    
    func initSearchResultTableView() {
        searchResultTableAdapter = SearchResultTableAdapter()
        tableSearchResult.register(UINib(nibName: R.nib.searchResultCellViewController.name, bundle: R.nib.searchResultCellViewController.bundle), forCellReuseIdentifier: R.nib.searchResultCellViewController.identifier)
        tableSearchResult.delegate = searchResultTableAdapter
        tableSearchResult.dataSource = searchResultTableAdapter
        searchResultTableAdapter?.setDelegate(delegate: self)
        searchResultTableAdapter?.setMovies(movies: movies)
        tableSearchResult.tableFooterView = UIView()
        tableSearchResult.es.addInfiniteScrolling {
            [unowned self] in
            self.pageNumber += 1
            self.presenter?.search(keyWord: self.resultSearchController.searchBar.text!, pageNumber: self.pageNumber)
        }
        tableSearchResult.reloadData()
    }
    
    func selectedMovie(movie: Movie) {
        performSegue(withIdentifier: R.segue.searchMoviesViewController.toMovieViewController.identifier, sender: movie)
    }
    
    func hideNoResult() {
        labelNoResult.isHidden = true
    }
    
    func showNoResult() {
        labelNoResult.isHidden = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MovieViewController
        destination.setMovie(movie: sender as! Movie)
        resultSearchController.isActive = false

    }
    
}
