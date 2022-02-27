//
//  SearchPresenter.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    func fetchWeatherDataForCity(name: String) {
        interactor?.fetchWeatherDataForCity(name: name)
    }
    
    func showDetailView(cityName: String) {
        router?.presentDetailView(view: view!,cityName: cityName)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func onSuccessOfFetchingWeatherData(response: WeatherData) {
        Constant.App.weatherData = response
        view?.onSuccessOfFetchingWeatherData()
    }
    
    func onFailureOfFetchingWeatherData(error: String) {
        view?.onFailureOfFetchingWeatherData(error: error)
    }
}
