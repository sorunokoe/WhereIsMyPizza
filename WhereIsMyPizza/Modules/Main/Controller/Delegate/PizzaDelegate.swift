//
//  PizzaDelegate.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class PizzaDelegate: NSObject, PizzaDelegateProtocol {
    
    weak var viewModel: MainViewModelProtocol?
    weak var router: MainRouterProtocol?
    
    init(viewModel: MainViewModelProtocol,
         router: MainRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        let place = viewModel.places.value[indexPath.row]
        self.router?.navigate(to: .pizzaDetail(place))
    }
    
}
