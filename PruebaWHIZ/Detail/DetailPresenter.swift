//
//  DetailPresenter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class DetailPresenter :   DetailViewToPresenterProtocol{
    
    
    var view:  DetailPresenterToViewProtocol?
    var interactor:  DetailPresenterToInteractorProtocol?
    var router:  DetailPresenterToRouterProtocol?
    
    var data: Movie?
    
    func updateView() {
        loadData()
      
    }
    
    
    func loadData() {
      
        if let vc = view as? UIViewController {
            vc.title = "Movie Detail"
            self.view?.labelTitle.text = data?.originalTitle
            self.view?.labelDescription.text = data?.overview
            self.view?.icImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.view?.icImage.sd_setImage(with: URL(string: Constant.URL.urlImages+(data?.posterPath ?? "")))
        }
      
    }
    
    func gotoDetail(data: String) {
        print("click gotoDetail ===> \(data)")
    }
}


extension  DetailPresenter :  DetailInteractorToPresenterProtocol {
    func fetchedDataSuccess(str: String) {
        self.view?.passData(str: str)
    }
    
    func fetchedDataError() {
        
    }
    
    
}
