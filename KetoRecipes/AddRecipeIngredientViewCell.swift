//
//  AddRecipeIngredientViewCell.swift
//  KetoRecipes
//
//  Created by Stephanie Lo on 2/15/17.
//  Copyright © 2017 Stephanie Lo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddRecipeIngredientViewCell: UITableViewCell {
    @IBOutlet weak var ingredientTitleLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    var viewModel: AddRecipeIngredientViewModel! = nil
    var delegate: AddRecipeIngredientDelegate! = nil

    override func awakeFromNib() {
        amountTextField.delegate = self
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        ingredientTitleLabel.text = viewModel.title
        amountTextField.placeholder = viewModel.placeholder
    }
}

extension AddRecipeIngredientViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        guard let text = textField.text, let convText = Int(text) else { return }
        self.delegate?.amountSet(amount: convText, forItem: viewModel.ingredient)
    }
}

struct AddRecipeIngredientViewModel {
    var ingredient: Ingredient
    var title: String {
        return ingredient.value(forKey: "name") as! String
    }
    var placeholder: String {
        return ingredient.value(forKey: "servingUnit") as! String
    }
    
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
    }
}

