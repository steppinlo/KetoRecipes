//
//  AddIngredientViewModel.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/15/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import CoreData

class AddIngredientViewModel {
    var client = ApiClient()
    var foods = [Ingredient]()
    
    func fetchIngredient(query: String, completion: @escaping () -> Void) {
        client.requestFood(query: query) { results in
            self.foods = results
            completion()
        }
    }
}
