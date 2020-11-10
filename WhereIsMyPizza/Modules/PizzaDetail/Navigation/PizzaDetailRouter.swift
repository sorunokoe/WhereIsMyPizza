//
//  PizzaDetailRouter.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class PizzaDetailRouter: PizzaDetailRouterProtocol {
    
    weak var vc: UIViewController!
    
    static func generateWith(place: PizzaVenue) -> UIViewController {
        let viewModel = PizzaDetailViewModel(place: place)
        let router = PizzaDetailRouter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            identifier: "PizzaDetailViewController",
            creator: { coder in
                PizzaDetailViewController(router: router, viewModel: viewModel, coder: coder)
        })
        router.vc = vc
        return vc
    }
    
}
