//
//  MainNavigationController.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pushSearchView()
    }
    
    func pushSearchView() {
        let searchView = SearchRouter.createModule()
        self.pushViewController(searchView, animated: true)
    }
}
