//
//  DetailView.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 27/02/22.
//

import UIKit

class DetailView: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    var cityName: String!
    
    @IBOutlet weak var tableViewWeatherData: UITableView!
    
    override func viewDidLoad() {
        configureBarButton()
        tableViewWeatherData.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        removeViewFromNavigationStack()
    }

    func configureBarButton() {
        let backButton = UIBarButtonItem()
        backButton.title = cityName
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func removeViewFromNavigationStack() {
        if (self.navigationController?.viewControllers.last as? DetailView) != nil {
            self.removeFromParent()
        } else {
            if let viewControllers = self.navigationController?.viewControllers {
                for viewController in viewControllers {
                    
                    if viewController is DetailView {
                        self.removeFromParent()
                    }
                }
            }
        }
    }
  
}

extension DetailView : DetailViewProtocol {
    
}

extension DetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = Constant.App.weatherData {
            presenter?.weatherInfoView(cityName: cityName , temeratureInfo: data.main!.temp, weatherInfo: data.weather!.first!.main, weatherDescInfo: data.weather!.first!.description, feelsLikeInfo: data.main!.feelsLike)
        }
    }
}

extension DetailView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClearCell", for: indexPath) as! ClearCell
            cell.configureCell(clear: Constant.App.weatherData?.weather?.first?.description ?? "")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CloudyCell", for: indexPath) as! CloudyCell
            cell.configureCell(cloudy: Constant.App.weatherData?.clouds?.all ?? 0)
            return cell
        }
    }
}
