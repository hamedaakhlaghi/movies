//
//  ViewController.swift
//  Movies
//
//  Created by Hamed on 4/21/19.
//  Copyright © 2019 Hamed. All rights reserved.
//

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

