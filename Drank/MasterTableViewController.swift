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
    
    
    override func viewDidLoad() {
        // Add search bar to the top of the table view
        tableView.tableHeaderView = searchController.searchBar
        
        // Set the background dim function
        searchController.dimsBackgroundDuringPresentation = false
        
        // Assign search results updater object to this class (self)
        searchController.searchResultsUpdater = self
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath)
        
        let cellUILabel = cell.viewWithTag(1) as? UILabel
        
        if let label = cellUILabel {
            label.text = recipies[indexPath.row].title
        }

        return cell
    }
    
    
    
    // MARK: - Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Recipe {

        let selectedRecipe = Recipe(title: recipies[indexPath.row].title, imageName: recipies[indexPath.row].imageName, ingredients: recipies[indexPath.row].ingredients, directions: recipies[indexPath.row].directions)
        
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
