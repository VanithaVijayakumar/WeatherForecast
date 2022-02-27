//
//  SearchInteractor.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import UIKit
import Alamofire

class SearchInteractor: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    
    func fetchWeatherDataForCity(name: String) {
        let headers: HTTPHeaders = [.contentType("application/x-www-form-urlencoded"), .accept("application/json")]
        let endPoint = "\(Constant.API.BaseURL)&q=\(name)"
        
        AF.request(endPoint, method: .get, parameters: nil,headers: headers).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(WeatherData.self, from: data!)
                    self.presenter?.onSuccessOfFetchingWeatherData(response: response)
                } catch {
                    self.presenter?.onFailureOfFetchingWeatherData(error: response.error?.localizedDescription ?? ErrorMessage.unknown.rawValue)
                    
                }
            case .failure(let error):
                self.presenter?.onFailureOfFetchingWeatherData(error: ErrorMessage.unknown.rawValue)
            }
        }
    }
}

