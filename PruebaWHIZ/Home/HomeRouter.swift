//
//  HomeRouter.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//



import Foundation
import UIKit

class HomeRouter: HomePresenterToRouterProtocol {

    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        let presenter : HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol =
        HomePresenter()
        let interactor : HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return factory(view)
        
        
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func displayAlert(title: String, message: String) {
       // ErrorHandler.showAlert(title: title, msg: message)
    }
    
    func goToList(origin: UIViewController, data: String) {
//        let vc = DetailRouter.createModule(data: data)
//        origin.navigationController?.pushViewController(vc, animated: true)
    }
    
    func prepareToGoToDetail(origin: UIViewController, data: Movie){
        let vc = DetailRouter.createModule(data: data)
        origin.navigationController?.pushViewController(vc, animated: true)
    }
}
