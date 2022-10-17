//
//  DetailRouter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//


import Foundation
import UIKit

class DetailRouter : DetailPresenterToRouterProtocol {

    static func createModule(data: Movie) -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        let presenter : DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol =
        DetailPresenter()
        let interactor : DetailPresenterToInteractorProtocol = DetailInteractor()
        let router: DetailPresenterToRouterProtocol =  DetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.data = data
        return view
        
        
    }

//    static var mainStoryBoard: UIStoryboard {
//        return UIStoryboard(name: "DetailViewController", bundle: Bundle.main)
//    }
    
    

    
    
}
