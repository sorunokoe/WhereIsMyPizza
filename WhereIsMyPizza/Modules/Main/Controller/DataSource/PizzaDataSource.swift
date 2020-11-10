//
//  PizzaDataSource.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class PizzaDataSource: NSObject, PizzaDataSourceProtocol {
    
    weak var viewModel: MainViewModelProtocol?
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.places.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = MainView.Identifier.pizzaCellId.rawValue
        if let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? PizzaCell {
            let place = self.viewModel?.places.value[indexPath.row]
            cell.set(place: place)
            return cell
        }
        return UITableViewCell()
    }
}
