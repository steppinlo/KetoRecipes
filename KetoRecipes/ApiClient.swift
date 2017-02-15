//
//  ApiClient.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/10/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import SwiftyJSON

var apiKeys: NSDictionary?

struct ApiClient {
    // Do any additional setup after loading the view, typically from a nib.
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "x-app-id": apiKeys!["nxId"]! as! String,
        "x-app-key":  apiKeys!["nxKey"]! as! String,
        "x-remote-user-id": "0"
    ]
    
    func requestFood(query: String, completion: @escaping ([Ingredient])->Void) {
        let param: Parameters = [
            "appId": apiKeys!["nxId"]! as! String,
            "appKey":  apiKeys!["nxKey"]! as! String,
            "query": query,
            "fields": [
                "item_name", "nf_total_carbohydrate", "nf_total_fat",
                "nf_protein", "nf_sugars", "nf_serving_size_qty",
                "brand_name", "nf_serving_size_unit", "nf_dietary_fiber",
                "nf_calories", "nf_serving_size_qty", "nf_serving_weight_grams",
                "item_type"
            ],
            "filters": ["item_type": 3]
        ]
        
        Alamofire.request("https://api.nutritionix.com/v1_1/search", method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            switch response.result {
            case let .success(data):
                let json = JSON(data)
                var ingredients = [Ingredient]()
                for item in json["hits"] {
                    let f = Ingredient.deserialize(d: item.1)
                    ingredients.append(f)
                }
                completion(ingredients)
                break
            default: print("OOPS")
            }
        }
    }
}
