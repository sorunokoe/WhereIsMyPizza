//
//  MainViewModel.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Moya

class MainViewModel: MainViewModelProtocol {
    
    var places: Box<[PizzaVenue]> = Box([])
    
    private var provider: MoyaProvider<PizzaService> = MoyaProvider<PizzaService>()
    
    func getPlaces(lat: String, lon: String) {
        provider.request(.findNearestPlaces(lat: lat, lon: lon,
                                            limit: 5, name: "pizza")) { (result) in
            switch result {
            case .success(let response):
                print(response)
                do {
                    let pizzaResponse: PizzaResponse = try response.map(PizzaResponse.self)
                    guard let group = pizzaResponse.response.groups.first else { return }
                    self.places.value = group.items
                } catch {
                    print("Error mapping: \(error)")
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
