//
//  PizzaDetailViewModel.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Foundation

class PizzaDetailViewModel: PizzaDetailViewModelProtocol {
    var place: PizzaVenue
    
    init(place: PizzaVenue) {
        self.place = place
    }
}
