//
//  PizzaDetailProtocols.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

protocol PizzaDetailRouterProtocol {
    
}
protocol PizzaDetailViewModelProtocol {
    var place: PizzaVenue { get }
}
protocol PizzaDetailViewControllerProtocol: UIViewController {
    
    var router: PizzaDetailRouterProtocol { get }
    var viewModel: PizzaDetailViewModelProtocol { get }
    
}
