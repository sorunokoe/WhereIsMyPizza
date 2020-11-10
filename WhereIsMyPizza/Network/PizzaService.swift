//
//  PizzaService.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Moya

enum PizzaService {
    case findNearestPlaces(lat: String, lon: String, limit: Int = 5, name: String)
}
extension PizzaService: TargetType {
    var baseURL: URL {
        return URL(string: Constant.environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .findNearestPlaces:
            return "/venues/explore"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var params: [String: Any] = [
            "client_id": Constant.environment.client_id,
            "client_secret": Constant.environment.client_secret
        ]
        switch self {
        case .findNearestPlaces(let lat, let lon, let limit, let name):
            params["v"] = "20180323"
            params["limit"] = limit
            params["ll"] = "\(lat),\(lon)"
            params["query"] = name
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
