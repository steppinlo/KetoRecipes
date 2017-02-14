//
//  IngredientSearchViewCell.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/13/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class IngredientSearchViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var carbs: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var fat: UILabel!

    override func awakeFromNib() {
        title.numberOfLines = 2
    }
    
    func setup(ingredient: NSManagedObject) {
        title.text = "\(ingredient.value(forKey: "name") as! String)"
        carbs.text = "carbs: \(ingredient.value(forKey: "carbs") as! Double)"
        protein.text = "protein: \(ingredient.value(forKey: "protein") as! Double)"
        calories.text = "calories: \(ingredient.value(forKey: "calories") as! Double)"
        fat.text = "fat: \(ingredient.value(forKey: "fat") as! Double)"

        title.sizeToFit()
    }
}
