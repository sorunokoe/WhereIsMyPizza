//
//  MainView.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit
import MapKit

class MainView: UIView {
    
    enum Identifier: String {
        case pizzaCellId
        
        var nibName: String {
            return "PizzaCell"
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    func configureViews() {
        placeholderView.layer.cornerRadius = 20
        tableView.layer.cornerRadius = 20
        
        placeholderView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        tableView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        
        let nib = UINib.init(nibName: Identifier.pizzaCellId.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifier.pizzaCellId.rawValue)
        
        tableView.rowHeight = 60
    }
}
