//
//  MainRouter.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var vc: UIViewController!
    
    static func generate() -> UIViewController {
        let viewModel = MainViewModel()
        let router = MainRouter()
        let pizzaDataSource = PizzaDataSource(viewModel: viewModel)
        let pizzaDelegate = PizzaDelegate(viewModel: viewModel,
                                          router: router)
        let locationService = LocationService()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(
            identifier: "MainViewController",
            creator: { coder in
                MainViewController(locationService: locationService,
                                   router: router,
                                   viewModel: viewModel,
                                   pizzaDataSource: pizzaDataSource,
                                   pizzaDelegate: pizzaDelegate,
                                   coder: coder)
        })
        router.vc = vc
        return vc
    }
    
    func navigate(to: MainRoutePaths) {
        switch to {
        case .pizzaDetail(let place):
            let vc = PizzaDetailRouter.generateWith(place: place)
            self.vc.present(vc, animated: true, completion: nil)
        }
    }
    
}
