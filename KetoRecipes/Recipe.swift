//
//  Recipe.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/10/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import CoreData

class Recipe: NSManagedObject {
    @NSManaged var ingredients: NSSet
}
