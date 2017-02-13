//
//  ViewController.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/9/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData

class ViewController: UIViewController {
    
    var recipe: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        requestFood(query: "steak") { foods in
            print(foods)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

