//
//  Constants.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import Foundation

struct Constant {
    
    struct App {
        static var weatherData: WeatherData?
    }
    
    struct API {
        static let APIKey = "65d00499677e59496ca2f318eb68c049"
        static let BaseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=524901&appid=65d00499677e59496ca2f318eb68c049")!
    }
    
    struct Parameter {
        static let temp = "Temp"
        static let feelsLike = "Feels Like:"
    }
    
}
