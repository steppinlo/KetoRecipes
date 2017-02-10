//
//  ViewController.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/9/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters: [String: AnyObject] = [
            "appId":  apiKeys!["nxId"]! as AnyObject,
            "appKey":  apiKeys!["nxKey"]! as AnyObject,
            "query":"apple" as AnyObject,
            "filters": [
                "item_type": 3
            ] as AnyObject
        ]
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://api.nutritionix.com/v1_1/search", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { data in
            print(data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

