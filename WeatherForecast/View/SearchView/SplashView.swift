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
        SearchRouter.createModule(view: self)
        textFieldCityName.addBottomBorder()
    }
    
    @IBAction func buttonLookup(_ sender: Any) {
        if textFieldCityName.text == "" {
            showAlert(message: ErrorMessage.emptyCityName.rawValue)
        } else{
            presenter?.fetchWeatherDataForCity(name: textFieldCityName.text!)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SearchView: SearchViewProtocol {
    func onSuccessOfFetchingWeatherData() {
      
    }
    
    func onFailureOfFetchingWeatherData(error: String) {
        showAlert(message: error)
    }
}
