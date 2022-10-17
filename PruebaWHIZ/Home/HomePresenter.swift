//
//  HomePresenter.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//


import Foundation
import UIKit

class HomePresenter :  HomeViewToPresenterProtocol{
    
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    func updateView() {
        interactor?.prepareResponseForModel()
    }
    
    func prepreGoToList(origin: UIViewController, data: String) {
        self.router?.goToList(origin: origin, data: data)
    }
}


extension HomePresenter : HomeInteractorToPresenterProtocol {
    func fetchedDataSuccess(data: Movies) {
        self.view?.dataMovies(data: data)
    }
    
    func fetchedDataError() {
        print("Error when getting service date")
    }
   
    
}
