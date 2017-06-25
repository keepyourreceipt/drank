//
//  MasterTableViewController.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let recipeDataSource = RecipeDataSource()
    
    var recipies = RecipeDataSource().recipies
    
    override func viewDidLoad() {
        
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = recipeDataSource
    }
    
    
        
    // MARK: - View Navigation
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



// MARK - Update search results
extension MasterTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!
        
        recipeDataSource.recipies.removeAll()
        
        for recipe in recipies {
            if recipe.title.lowercased().range(of: searchTerm.lowercased()) != nil {
                recipeDataSource.recipies.append(recipe)
            }
        }
        
        tableView.reloadData()
    }
}
