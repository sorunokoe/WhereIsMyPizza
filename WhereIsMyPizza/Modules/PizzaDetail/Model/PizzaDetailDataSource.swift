//
//  PizzaDetailDataSource.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Foundation

struct PizzaDetailDataSource {
    
    static var sections: [Section] = [.name, .adress, .city, .state]
    
    enum Section {
        case name, adress, city, state
    }
    
}
