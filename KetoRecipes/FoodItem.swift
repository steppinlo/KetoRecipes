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

class Ingredient: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var carbs: Double
    @NSManaged var protein: Double
    @NSManaged var calories: Double
    @NSManaged var fat: Double
    @NSManaged var fiber: Double
    @NSManaged var sugars: Double
    @NSManaged var servingQty: Int
    @NSManaged var servingUnit: String
    @NSManaged var servingWeight: Double
    @NSManaged var amount: Int
    @NSManaged var recipes: NSSet
//
    static func deserialize(d: JSON) -> NSManagedObject {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        var entity = NSEntityDescription.entity(forEntityName: "FoodItem",
                                              in: managedContext)!
        let ingredient = NSManagedObject(entity: entity,
                                       insertInto: nil)
        
        ingredient.setValue(d["_id"].string ?? "", forKey: "id")
        
        let subfield = d["fields"]
        ingredient.setValue(subfield["item_name"].string ?? "", forKey: "name")
        ingredient.setValue(subfield["nf_total_carbohydrate"].double ?? 0, forKey: "carbs")
        ingredient.setValue(subfield["nf_protein"].double ?? 0, forKey: "protein")
        ingredient.setValue(subfield["nf_calories"].double ?? 0, forKey: "calories")
        ingredient.setValue(subfield["nf_total_fat"].double ?? 0, forKey: "fat")
        ingredient.setValue(subfield["nf_dietary_fiber"].double ?? 0, forKey: "fiber")
        ingredient.setValue(subfield["nf_sugars"].double ?? 0, forKey: "sugar")
        ingredient.setValue(subfield["nf_serving_size_qty"].int ?? 0, forKey: "servingQty")
        ingredient.setValue(subfield["nf_serving_size_unit"].string ?? "", forKey: "servingUnit")
        ingredient.setValue(subfield["nf_serving_weight_grams"].double ?? 0, forKey: "servingWeight")
        
        return ingredient
    }
}
