//
//  ADJUserModel.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation
import ObjectMapper

let kUserResults =  "results"

class ADJResults: NSObject, Mappable {
    
    var results : [Results]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
     results    <- map[kUserResults]
    }
    
}

