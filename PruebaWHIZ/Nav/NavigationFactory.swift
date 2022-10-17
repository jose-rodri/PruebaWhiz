//
//  NavigationFactory.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//


import UIKit

typealias  NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    //metodo suficiente para hacer la navegacion
    static func Builder(rootview: UIViewController) -> UINavigationController {
        
        let navigationControler = UINavigationController(rootViewController: rootview)
   
        return navigationControler
    }
    
}
        
