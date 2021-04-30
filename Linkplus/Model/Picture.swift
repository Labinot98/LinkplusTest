//
//  Picture.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation
import ObjectMapper

let kLarge = "large"
let kMedium = "medium"
let kThumnail = "thumbnail"


class Picture:NSObject, Mappable {
    
    var large: String?
    var medium : String?
    var thumbnail: String?

    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        large <- map[kLarge]
        medium  <- map[kMedium]
        thumbnail   <- map[kThumnail]
    }
}
