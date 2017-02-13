//
//  FoodItem.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/10/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

struct FoodItem {
    let name: String
    let carbs: Double
    let protein: Double
    let calories: Double
    let fat: Double
    let fiber: Double
    let sugars: Double
    let servingQty: Int
    let servingUnit: String
    let servingWeight: Double
    let amount = 1
    
    static func deserialize(d: Any) {
        let json = JSON(d)["foods"].first?.1
        let entityPerson = NSEntityDescription.entityForName("Ingredient", inManagedObjectContext: self.managedObjectContext)
        let newChildPerson = NSManagedObject(entity: entityPerson!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        FoodItem(
            name: json?["food_name"].string ?? "",
            carbs: json?["nf_total_carbohydrate"].double ?? 0,
            protein: json?["nf_protein"].double ?? 0,
            calories: json?["nf_calories"].double ?? 0,
            fat: json?["nf_total_fat"].double ?? 0,
            fiber: json?["nf_dietary_fiber"].double ?? 0,
            sugars: json?["nf_sugars"].double ?? 0,
            servingQty: json?["serving_qty"].int ?? 0,
            servingUnit: json?["serving_unit"].string ?? "",
            servingWeight: json?["serving_weight_grams"].double ?? 0
        )
    }
}
