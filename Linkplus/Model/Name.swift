//
//  Name.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation
import ObjectMapper

let kTitle = "title"
let kFirst = "first"
let kLast = "last"

class Name:NSObject, Mappable {
    
    var title : String?
    var first: String?
    var last : String?
    
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    
    
    func mapping(map: Map) {
        title <- map[kTitle]
        first <- map[kFirst]
        last    <- map[kLast]
    }
    
}
