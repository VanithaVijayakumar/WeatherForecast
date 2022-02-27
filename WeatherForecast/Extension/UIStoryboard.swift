//
//  UIStoryboard.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import UIKit

extension UIStoryboard {
    
    static func storyBoard(withName name: String)-> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
    
    static func mainStoryBoard() -> UIStoryboard {
        return storyBoard(withName: "Main")
    }
    
    static func SearchView() -> SearchView {
        return mainStoryBoard().instantiateViewController(withIdentifier: "SearchView") as! SearchView
    }
    
    static func DetailView() -> DetailView {
        return mainStoryBoard().instantiateViewController(withIdentifier: "DetailView") as! DetailView
    }
    
    static func weatherInfoView() -> WeatherInfoView {
        return mainStoryBoard().instantiateViewController(withIdentifier: "WeatherInfoView") as! WeatherInfoView
    }
}
