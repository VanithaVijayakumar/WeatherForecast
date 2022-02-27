//
//  DetailRouter.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    
    class func createModule() -> DetailView {
        let view = UIStoryboard.DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
    
    func weatherInfoView(cityName: String,temeratureInfo: Float!,weatherInfo: String!,weatherDescInfo: String!,feelsLikeInfo: Float!,view: DetailViewProtocol) {
        if let DetailView = view as? UIViewController {
            let weatherInfoView = UIStoryboard.weatherInfoView()
            weatherInfoView.cityName = cityName
            weatherInfoView.feelsLikeInfo = feelsLikeInfo
            weatherInfoView.temeratureInfo = temeratureInfo
            weatherInfoView.weatherInfo = weatherInfo
            weatherInfoView.weatherDescInfo = weatherDescInfo
            DetailView.navigationController?.pushViewController(weatherInfoView, animated: true)
        }
    }
}

