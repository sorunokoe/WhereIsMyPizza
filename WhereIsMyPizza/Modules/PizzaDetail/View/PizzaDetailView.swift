//
//  PizzaDetailView.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class PizzaDetailView: UIView {    
    
    enum Identifier: String {
        case titleCellId
        
        var nibName: String {
            return "TitleCell"
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func configureViews() {
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        let nib = UINib.init(nibName: Identifier.titleCellId.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifier.titleCellId.rawValue)
        tableView.rowHeight = 24
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0)
    }
    
}
