//
//  SearchView.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import UIKit

class SearchView: UIViewController {
    
    var presenter: SearchPresenterProtocol?
        
    @IBOutlet weak var textFieldCityName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldCityName.addBottomBorder()
    }
    
    @IBAction func buttonLookup(_ sender: Any) {
        if textFieldCityName.text == "" {
            showAlert(message: ErrorMessage.emptyCityName.rawValue)
        } else{
            presenter?.fetchWeatherDataForCity(name: textFieldCityName.text!)
        }
    }
    
    func configureBarButton() {
        self.navigationItem.leftBarButtonItems = []
       // hide the default back buttons
        self.navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.leftBarButtonItem = nil
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        let backButton = UIBarButtonItem()
//        backButton.title = ""
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SearchView: SearchViewProtocol {
    func onSuccessOfFetchingWeatherData() {
        presenter?.showDetailView(cityName: textFieldCityName.text!)
    }
    
    func onFailureOfFetchingWeatherData(error: String) {
        showAlert(message: error)
    }
}
