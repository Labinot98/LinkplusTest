//
//  ADJServices.swift
//  iOSTestLinkplus
//
//  Created by Pajaziti Labinot on 30.4.21..
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON
import ObjectMapper

class ADJProductService {
    
        let URL_ALL_PRODUCT = "https://randomuser.me/api?page=1&results=20"
        
        static let instance = ADJProductService()
        func listOfProduct(_ completion: @escaping(Bool, [Results]) -> Void) {
            
            AF.request(URL_ALL_PRODUCT, method: .get).validate().responseJSON {(response) in
                switch response.result {
                case let .success(value):
                    guard let data = response.value as? [String: Any] else { return }
                    let product = Mapper<Results>().mapArray(JSONObject: data["results"])
                    
                    completion(true, product!)
                    print(value)
                case let .failure(error):
                    completion(false, [])
                }
            }
        }
    }
