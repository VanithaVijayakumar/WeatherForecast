//
//  SearchRouter.swift
//  WeatherForecast
//
//  Created by Vanitha Vijayakumar on 26/02/22.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterProtocol {
    
    class func createModule() -> SearchView {
        let view = UIStoryboard.SearchView()
        let presenter: SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter()
        let interactor: SearchInteractorInputProtocol = SearchInteractor()
        let router: SearchRouterProtocol = SearchRouter()
        
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        return view
    }
    
    func presentDetailView(view: SearchViewProtocol,cityName: String) {
        if let SearchView = view as? UIViewController {
            let DetailView = DetailRouter.createModule()
            DetailView.cityName = cityName
            SearchView.modalPresentationStyle = .fullScreen
            SearchView.navigationController?.pushViewController(DetailView, animated: true)
        }
    }
}
