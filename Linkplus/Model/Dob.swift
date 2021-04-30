//
//  Dob.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation

import ObjectMapper

let kDate = "date"
let kAge = "age"

class Dob:NSObject, Mappable {
    
    var date: String?
    var age : Int?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date <- map[kDate]
        age <- map[kAge]
    }
}
