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
    
    func save(food: FoodItem) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Recipe",
                                       in: managedContext)!
        
        let ingredients = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
        
        // 3
        ingredients.setValue(food, forKeyPath: "ingredients")
        
        // 4
        do {
            try managedContext.save()
            recipe.append(food)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

