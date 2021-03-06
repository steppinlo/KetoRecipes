//
//  AddRecipeTableViewController.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/14/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

enum AddRecipeSections: Int {
    case Title = 0
    case Ingredients = 1
    case TotalMacros = 2
    case Instructions = 3
    case Picture = 4
    
    static let allSections = [Title, Ingredients, TotalMacros, Instructions, Picture]
    static var count: Int { return AddRecipeSections.Picture.rawValue + 1}
}

class AddRecipeTableViewController: UITableViewController {
    var display = AddRecipeSections.self
    var sectionWithCount = [AddRecipeSections: Int]()
    var viewModel = AddRecipeViewModel()

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        for item in display.allSections {
            sectionWithCount[item] = 1
        }
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
        addDismissKeyboardGesture()
    }

    @IBAction func closeModalButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = display.allSections[indexPath.section]
        switch section {
        case .Title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
            return cell
        case .Ingredients:
            if indexPath.row == sectionWithCount[display.Ingredients]! - 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddIngredient", for: indexPath)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Ingredient", for: indexPath) as! AddRecipeIngredientViewCell
                let vm = AddRecipeIngredientViewModel(ingredient: viewModel.ingredients[indexPath.row])
                cell.viewModel = vm
                cell.delegate = self
                return cell
            }
        case .TotalMacros:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalMacros", for: indexPath) as! AddRecipeTotalMacrosViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
        }
        
    }
    
    @IBAction func addIngredient(_ sender: UIButton) {
        let nc = UINavigationController()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddIngredientTableViewController") as! AddIngredientTableViewController
        vc.delegate = self
        nc.pushViewController(vc, animated: false)
        self.present(nc, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sec = AddRecipeSections(rawValue: section) else { return 0 }
        return sectionWithCount[sec]!
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return display.count
    }
}

extension AddRecipeTableViewController: AddRecipeTableViewControllerDelegate {
    internal func addIngredient(ingredient: Ingredient) {
        sectionWithCount[display.Ingredients]! += 1
        viewModel.ingredientWithAmt[ingredient] = 0
        tableView.reloadData()
    }
}

extension AddRecipeTableViewController: AddRecipeIngredientDelegate {
    func amountSet(amount: Int, forItem: Ingredient) {
        print(amount)
    }
}

protocol AddRecipeTableViewControllerDelegate {
    func addIngredient(ingredient: Ingredient)
}

protocol AddRecipeIngredientDelegate {
    func amountSet(amount: Int, forItem: Ingredient)
}

