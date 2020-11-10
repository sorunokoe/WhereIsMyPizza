//
//  PizzaResponse.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Foundation

struct PizzaResponse: Decodable {
    var response: PizzaGroups
    
    enum Keys: CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        response = try container.decode(PizzaGroups.self, forKey: .response)
    }
    
}
struct PizzaGroups: Decodable {
    var groups: [PizzaGroup]
    
    enum Keys: CodingKey {
        case groups
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        groups = try container.decode([PizzaGroup].self, forKey: .groups)
    }
}
struct PizzaGroup: Decodable {
    var items: [PizzaVenue]
    
    enum Keys: CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        items = try container.decode([PizzaVenue].self, forKey: .items)
    }

}
