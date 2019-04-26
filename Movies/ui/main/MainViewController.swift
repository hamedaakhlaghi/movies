
import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: R.segue.mainViewController.toMoviesList , sender: self)
    }
    
    func initUIComponents() {
        
    }
    
    func initListeners() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


}

