//
//  DetailProtocol.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import Foundation


//MARK:  DetailViewProtocol
protocol DetailViewProtocol:AnyObject {
    var presenter: DetailPresenterProtocol? {get set}
}

//MARK:DetailPresenterProtocol
protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? {get set}
    var interactor: DetailInteractorInputProtocol? {get set}
    var router: DetailRouterProtocol? {get set}
    
    func weatherInfoView(cityName: String,temeratureInfo: Float!,weatherInfo: String!,weatherDescInfo: String!,feelsLikeInfo: Float!)
}

//MARK:DetailInteractorInputProtocol
protocol DetailInteractorInputProtocol: AnyObject{
    var presenter: DetailInteractorOutputProtocol? {get set}
    
}

//MARK:DetailInteractorOutputProtocol
protocol DetailInteractorOutputProtocol: AnyObject {
}

//MARK:DetailRouterProtocol
protocol DetailRouterProtocol: AnyObject {
    func weatherInfoView(cityName: String,temeratureInfo: Float!,weatherInfo: String!,weatherDescInfo: String!,feelsLikeInfo: Float!,view: DetailViewProtocol)
}

