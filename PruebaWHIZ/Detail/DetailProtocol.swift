//
//  DetailProtocol.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation
import UIKit


protocol DetailPresenterToViewProtocol: class {
    var labelTitle: UILabel! { get set }
    var icImage: UIImageView! { get set }
    var labelDescription: UILabel! { get set }
    
  

}

protocol DetailInteractorToPresenterProtocol: class {
    func fetchedDataSuccess()
    func fetchedDataError()
}


protocol DetailPresenterToInteractorProtocol: class {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    func prepareResponseForModel(str: String)
}


protocol DetailViewToPresenterProtocol: class {
    var view: DetailPresenterToViewProtocol? { get set }
    var interactor:  DetailPresenterToInteractorProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    var data: Movie? { get set }
    
    func updateView()
  
}

protocol  DetailPresenterToRouterProtocol: class {
    static func  createModule(data: Movie) -> UIViewController
   
}
