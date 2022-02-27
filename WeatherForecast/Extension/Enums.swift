//
//  Enums.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import Foundation

enum ErrorMessage: String {
    case offline = "No Internet Connection. Please try again."
    case unknown  = "Something went wrong. Please try after sometime."
    case InvalidResponse = "Invalid response"
    case emptyCityName = "Please enter a city name"
}
