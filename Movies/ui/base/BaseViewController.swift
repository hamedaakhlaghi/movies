//

import Foundation
import UIKit


typealias BaseViewController = BaseViewControllerClass & ViewControllerProtocol

protocol ViewControllerProtocol{
    func initUIComponents()
    func initListeners()
}

open class BaseViewControllerClass : UIViewController{
    
    open override func viewDidLoad() {
        guard let controller = self as? BaseViewController else {
            return
        }
        
        controller.initUIComponents()
        controller.initListeners()
    }
}
