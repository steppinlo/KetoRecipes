//
//  AddRecipeTableViewController.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/14/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import UIKit

enum AddRecipeSections: Int {
    case Title = 0
    case Ingredients = 1
    case Instructions = 2
    case Picture = 3
    
    static let allSections = [Title, Ingredients, Instructions, Picture]
    static var count: Int { return AddRecipeSections.Picture.rawValue + 1}
}

class AddRecipeTableViewController: UITableViewController {
    var display = AddRecipeSections.self
    var sectionWithCount = [AddRecipeSections: Int]()

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        for item in display.allSections {
            sectionWithCount[item] = 1
        }
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
    }

    @IBAction func closeModalButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sec = AddRecipeSections(rawValue: section) else { return 0 }
        return sectionWithCount[sec]!
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return AddRecipeSections.count
    }
    

}
