//
//  HomeViewController.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/14/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var addRecipeButton: UIButton!
    
    @IBAction func addRecipeButtonTapped(_ sender: UIButton) {
        let nc = UINavigationController()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddRecipeTableViewController") as! AddRecipeTableViewController
        nc.pushViewController(vc, animated: false)
        self.present(nc, animated: true, completion: nil)
        
    }
}
