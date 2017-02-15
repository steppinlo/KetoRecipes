//
//  AddRecipeViewModel.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/15/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import CoreData

struct AddRecipeViewModel {
    var ingredients: [Ingredient] {
        return Array(ingredientWithAmt.keys) as! [Ingredient]
    }
    var macrosCount = [
        "carbs": 0,
        "calories": 0,
        "fiber": 0,
        "fat": 0,
        "protein": 0
    ]
    var ingredientWithAmt = [Ingredient:Int]()

    func calculateMacros() {
        for (ingredient, amount) in ingredientWithAmt {
            
        }
    }
}
