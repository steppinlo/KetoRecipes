//
//  ApiClient.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/10/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import Alamofire

var apiKeys: NSDictionary?

//struct ApiClient {

    // Do any additional setup after loading the view, typically from a nib.
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "x-app-id": apiKeys!["nxId"]! as! String,
        "x-app-key":  apiKeys!["nxKey"]! as! String
    ]

    func requestFood(query: String, completion: @escaping (FoodItem)->Void) {
        let parameters: [String: AnyObject] = [
            "query": query as AnyObject
        ]
        
        Alamofire.request("https://trackapi.nutritionix.com/v2/natural/nutrients", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            switch response.result {
            case let .success(data):
                let f = FoodItem.deserialize(d: data)
                completion(f)
            default: print("OOPS")
            }
        }
    }
//}
