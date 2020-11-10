//
//  Constant.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import Foundation

enum Environment {
    
    case development, production
    
    var baseURL: String {
        return "https://api.foursquare.com/v2"
    }
    var client_id: String {
        return "PTVM40HHTODD03NT2GZ5IEC2ZJJYJVWJAKJTK1KR045GTVJR"
    }
    var client_secret: String {
        return "X3G1LAWI1C35Z3ZLGJ3PEYVOWBRAF1PXSE0GOE4KGON05LH1"
    }
    
}

struct Constant {
    
    static let environment: Environment = .development

}
