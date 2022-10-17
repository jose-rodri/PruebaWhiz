//
//  DetailInteractor.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation


class  DetailInteractor : DetailPresenterToInteractorProtocol {
    
    var presenter:  DetailInteractorToPresenterProtocol?
    
    func prepareResponseForModel(str: String) {
        self.presenter?.fetchedDataSuccess(str: str)
    }
    
    
}
