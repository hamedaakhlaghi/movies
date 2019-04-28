
import UIKit
import SDWebImage
class MovieViewController: BaseViewController, MovieViewProtocol {
    
    var movie: Movie?
    var presenter: MoviePresenterProtocol?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDirector: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelRuntime: UILabel!
    @IBOutlet weak var labelPlot: UILabel!
    @IBOutlet weak var labelWriter: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MoviePresenter(view: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getFullMovieData(movie: movie!)
    }
    
    func initUIComponents() {
        presentMovie()
    }
    
    
    func initListeners() {
        
    }
    
    func setMovie(movie: Movie) {
        self.movie = movie
    }
    
    func setFullMovieData(movie: Movie) {
        self.movie = movie
        presentMovie()
        
    }
    
    func presentMovie() {
        self.labelTitle.text = movie?.title
        self.labelYear.text = movie?.year
        self.labelGenre.text = movie?.genre
        self.labelPlot.text = movie?.plot
        self.labelWriter.text = movie?.writer
        self.labelRuntime.text = movie?.runtime
        self.labelDirector.text = movie?.director
        self.imagePoster.sd_setImage(with: URL(string: movie!.posterUrl!), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
