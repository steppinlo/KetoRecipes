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

class RecipesTableViewController: UITableViewController {
    
    var recipe = [NSManagedObject]()
    let apiClient = ApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "IngredientSearchCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ingredientCell")
        
        apiClient.requestFood(query: "chicken") { [weak self] foods in
            self?.recipe = foods
            self?.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientSearchViewCell
//        let obj = recipe[indexPath.row] as? NSManagedObject
//        cell.textLabel?.text = obj?.value(forKey: "name") as! String?
        cell.setup(ingredient: (recipe[indexPath.row] as? NSManagedObject)!)
        return cell
    }
}


