//
//  MasterTableViewController.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var recipeDataSource = RecipeDataSource()
    var recipies = RecipeDataSource().recipies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = recipeDataSource
    }
    
    
    // MARK: - View Navigation
    // TO DO: resolve incorrect details page loading on click after search
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> RecipeDataSource.Recipe {

        let selectedRecipe = RecipeDataSource.Recipe(title: recipies[indexPath.row].title, imageName: recipies[indexPath.row].imageName, ingredients: recipies[indexPath.row].ingredients,directions: recipies[indexPath.row].directions)
        
        return selectedRecipe
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            if let detailViewController = destination {
                detailViewController.recipeTitleText = recipies[indexPath.row].title
                detailViewController.recipeImageName = recipies[indexPath.row].imageName
                detailViewController.recipeDirectionsText = recipies[indexPath.row].directions
            }
        }

    }
}
