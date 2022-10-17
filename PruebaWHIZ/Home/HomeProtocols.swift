//
//  HomeProtocols.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//


import Foundation
import UIKit


protocol HomePresenterToViewProtocol: class {
    
    func dataMovies(data: Movies)

}

protocol HomeInteractorToPresenterProtocol: class {
    func fetchedDataSuccess(data: Movies)
    func fetchedDataError()
}


protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func prepareResponseForModel()
}


protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor:  HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    
    func updateView()
    func prepreGoToList(origin: UIViewController, data: String)
}

protocol  HomePresenterToRouterProtocol: class {
    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UINavigationController
    func goToList(origin: UIViewController, data: String)
    func displayAlert(title: String, message: String)
    
    func prepareToGoToDetail(origin: UIViewController, data: Movie)
}
