//
//  Location.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation
import ObjectMapper

let kCity = "city"
let kState = "state"
let kCountry = "country"
let kPostCode = "postcode"


class Location:NSObject, Mappable {
    
    var city : String?
    var state : String?
    var country: String?
    var postalCode : Int?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city <- map[kCity]
        state   <- map[kState]
        country <- map[kCountry]
        postalCode  <- map[kPostCode]
    }
}

