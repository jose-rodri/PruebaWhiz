//
//  HomeInteractor.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//


import RxSwift

class HomeInteractor : HomePresenterToInteractorProtocol {
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    
    func prepareResponseForModel() {
        webService.load(modelType: Movies.self, from: .listMovie(serviceType: .MovieList))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (results) in
                results.validate {
                    self?.presenter?.fetchedDataSuccess(data: results)
                }
            }, onError: { [weak self] (error) in
                self?.presenter?.fetchedDataError()
            }).disposed(by: disposeBag)
    }
    
    
}
