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

class AddIngredientTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel = AddIngredientViewModel()
    let apiClient = ApiClient()
    var delegate: AddRecipeTableViewControllerDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        let nibName = UINib(nibName: "IngredientSearchCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ingredientCell")
        
        addDismissKeyboardGesture()
    }

    @IBAction func closeModalTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.foods.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientSearchViewCell
        cell.setup(ingredient: viewModel.foods[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.addIngredient(ingredient: viewModel.foods[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddIngredientTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        guard let text = searchBar.text else { return }
        viewModel.fetchIngredient(query: text) {
            self.tableView.reloadData()
        }
    }
}

