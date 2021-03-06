
import UIKit
import SDWebImage
class SearchResultCellViewController: UITableViewCell {

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setMovie(movie: Movie) {
        imagePoster.sd_setImage(with: URL(string: movie.posterUrl!), placeholderImage: UIImage(named: "placeholder.png"))
        labelTitle.text = movie.title
        labelType.text = movie.type
        labelYear.text = movie.year
    }
    
}
