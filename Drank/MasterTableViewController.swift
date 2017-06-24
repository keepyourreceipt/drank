//
//  MasterTableViewController.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    // Get a reference to the UISearchcontroller
    let searchController = UISearchController(searchResultsController: nil)
    
    // Get a reference to the recipe data source
    let recipeDataSource = RecipeDataSource()
    
    let recipies = RecipeDataSource().recipies
    
    override func viewDidLoad() {
        // Add search bar to the top of the table view
        tableView.tableHeaderView = searchController.searchBar
        
        // Set the background dim function
        searchController.dimsBackgroundDuringPresentation = false
        
        // Assign search results updater object to this class (self)
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = recipeDataSource
    }
        
    // MARK: - Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> RecipeDataSource.Recipe {

        let selectedRecipe = RecipeDataSource.Recipe(title: recipies[indexPath.row].title, imageName: recipies[indexPath.row].imageName, ingredients: recipies[indexPath.row].ingredients,directions: recipies[indexPath.row].directions)
        
        return selectedRecipe
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
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


// Extend this class to conform to UISearchResultsUpdating protocol
extension MasterTableViewController: UISearchResultsUpdating {
    
    // Create a function to update text based on search bar content
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}
