//
//  SearchResponseWrapper.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import Foundation

struct WeatherData: Codable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: WindData?
    var clouds: Clouds?
    var dt: Int?
    var sys: System?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
}

struct Coord: Codable {
    var lon: Float?
    var lat: Float?
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Main: Codable {
    var temp: Float?
    var feelsLike: Float?
    var tempMin: Float?
    var tempMax: Float?
    var pressure: Int?
    var humidity: Int?
    var groundLevel: Int?
    var seaLevel: Int?
    
    enum mainCodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case groundLevel = "grnd_level"
        case seaLevel = "sea_level"
        case pressure,humidity,temp
    }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: mainCodingKeys.self)
            self.feelsLike = try values.decodeIfPresent(Float.self, forKey: .feelsLike)
            self.temp = try values.decodeIfPresent(Float.self, forKey: .temp)
            self.tempMin = try values.decodeIfPresent(Float.self, forKey: .tempMin)
            self.seaLevel = try values.decodeIfPresent(Int.self, forKey: .seaLevel)
            self.tempMax = try values.decodeIfPresent(Float.self, forKey: .tempMax)
            self.pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
            self.humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
            self.groundLevel = try values.decodeIfPresent(Int.self, forKey: .groundLevel)
    }
}

struct WindData: Codable {
    var speed: Float?
    var deg: Int?
    var gust: Float?
}

struct Clouds: Codable {
    var all: Int?
}

struct System: Codable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}
