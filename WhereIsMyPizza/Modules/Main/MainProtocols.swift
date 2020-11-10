//
//  MainProtocols.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

protocol PizzaDataSourceProtocol: UITableViewDataSource {
    var viewModel: MainViewModelProtocol? { get }
}
protocol PizzaDelegateProtocol: UITableViewDelegate {
    var viewModel: MainViewModelProtocol? { get }
    var router: MainRouterProtocol? { get }
}
protocol MainRouterProtocol: class {
    func navigate(to: MainRoutePaths)
}
protocol MainViewModelProtocol: class {
    var places: Box<[PizzaVenue]> { get }
    func getPlaces(lat: String, lon: String)
}
protocol MainViewControllerProtocol: UIViewController {
    var locationService: LocationServiceProtocol { get }
    var viewModel: MainViewModelProtocol { get }
    var router: MainRouterProtocol { get }
    var pizzaDataSource: PizzaDataSourceProtocol { get }
    var pizzaDelegate: PizzaDelegateProtocol { get }
}
