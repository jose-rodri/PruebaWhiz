//
//  DetailViewController.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
     
    var presenter: DetailViewToPresenterProtocol?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var icImage: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       presenter?.updateView()

    }


    
    
}
   
extension DetailViewController :  DetailPresenterToViewProtocol {
    func passData(str: String){
        print("get: \(str)")
        //self.data = str
    }
    
}
