//
//  Resultss.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation
import ObjectMapper

let kUserGender = "gender"
let kUserName = "name"
let kUserLocation = "location"
let kUserEmail = "email"
let kUserDob = "dob"
let kUserPhone = "phone"
let kUserPicture = "picture"
let kUserNat = "nat"

class Results:NSObject, Mappable {
    
    var userGender : String?
    var userName : Name?
    var userLocation : Location?
    var userEmail : String?
    var userDob : Dob?
    var userPhone : String?
    var userPicture : Picture?
    var userNat : String?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        userGender <- map[kUserGender]
        userName <- map[kUserName]
        userLocation <- map[kUserLocation]
        userEmail <- map[kUserEmail]
        userDob <- map[kUserDob]
        userPhone   <- map[kUserPhone]
        userPicture <- map[kUserPicture]
        userNat <- map[kUserNat]
    }
}
