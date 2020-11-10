//
//  PizzaPlace.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Foundation

struct PizzaVenue: Decodable {
    var venue: PizzaPlace
}
struct PizzaPlace: Decodable {
    var id: String
    var name: String
    var location: PizzaLocation
    
    enum Keys: CodingKey {
        case id, name, location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(PizzaLocation.self, forKey: .location)
    }
    
}
struct PizzaLocation: Decodable {
    var address: String
    var lat: Double
    var lng: Double
    var city: String
    var state: String
    
    enum Keys: CodingKey {
        case address
        case lat
        case lng
        case city
        case state
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        address = try container.decode(String.self, forKey: .address)
        lat = try container.decode(Double.self, forKey: .lat)
        lng = try container.decode(Double.self, forKey: .lng)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
    }

}
