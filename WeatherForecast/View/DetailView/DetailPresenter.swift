//
//  DetailPresenter.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {

    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    func weatherInfoView(cityName: String,temeratureInfo: Float!,weatherInfo: String!,weatherDescInfo: String!,feelsLikeInfo: Float!) {
        router?.weatherInfoView(cityName: cityName, temeratureInfo: temeratureInfo, weatherInfo: weatherInfo, weatherDescInfo: weatherDescInfo, feelsLikeInfo: feelsLikeInfo, view: view!)
    }
}

extension DetailPresenter : DetailInteractorOutputProtocol {
    
}
