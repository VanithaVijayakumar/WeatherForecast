//
//  WeatherInfoView.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import UIKit

class WeatherInfoView: UIViewController {
    
    var cityName: String!
    var temeratureInfo: Float!
    var weatherInfo: String!
    var weatherDescInfo: String!
    var feelsLikeInfo: Float!

    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBarButton()
        configureView()
    }
    
    func configureBarButton() {
        let backButton = UIBarButtonItem()
        backButton.title = cityName
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func configureView() {
        temperature.text = "\(temeratureInfo!)"
        weather.text = weatherInfo
        weatherDesc.text = weatherDescInfo
        feelsLike.text = "\(Constant.Parameter.feelsLike)\(feelsLikeInfo!)"
    }
}
