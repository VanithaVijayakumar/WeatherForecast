//
//  SearchProtocol.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import Foundation

//MARK:  SearchViewProtocol
protocol SearchViewProtocol:AnyObject {
    var presenter: SearchPresenterProtocol? {get set}
    
    func onSuccessOfFetchingWeatherData()
    func onFailureOfFetchingWeatherData(error: String)
}

//MARK:SearchPresenterProtocol
protocol SearchPresenterProtocol: AnyObject {
    var view: SearchViewProtocol? {get set}
    var interactor: SearchInteractorInputProtocol? {get set}
    var router: SearchRouterProtocol? {get set}
    
    func fetchWeatherDataForCity(name: String)
    func showDetailView(cityName: String)
}

//MARK:SearchInteractorInputProtocol
protocol SearchInteractorInputProtocol: AnyObject{
    var presenter: SearchInteractorOutputProtocol? {get set}
    
    func fetchWeatherDataForCity(name: String)
}

//MARK:SearchInteractorOutputProtocol
protocol SearchInteractorOutputProtocol: AnyObject {
    func onSuccessOfFetchingWeatherData(response: WeatherData)
    func onFailureOfFetchingWeatherData(error: String)
}

//MARK:SearchRouterProtocol
protocol SearchRouterProtocol: AnyObject {
    
    func presentDetailView(view: SearchViewProtocol,cityName: String) 
}

