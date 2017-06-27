//
//  MasterTableViewController.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var sortedRecipies = recipies.sorted(by: { $0.title < $1.title })
    var searchResults = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    
    // MARK - Setup table view structure and create cells
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedRecipies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath)
        
        let cellLabel = cell.viewWithTag(1) as? UILabel
        if let label = cellLabel {
            label.text = sortedRecipies[indexPath.row].title
        }
        
        return cell
    }
    
    
    // MARK: - View Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Recipe {

        let selectedCell = Recipe(title: sortedRecipies[indexPath.row].title, imageName: sortedRecipies[indexPath.row].imageName, ingredients: sortedRecipies[indexPath.row].ingredients,directions: sortedRecipies[indexPath.row].directions)
        
        return selectedCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        searchController.isActive = false
        
        let destination = segue.destination as? DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            if let detailViewController = destination {
                detailViewController.recipeTitleText = sortedRecipies[indexPath.row].title
                detailViewController.recipeImageName = sortedRecipies[indexPath.row].imageName
                detailViewController.recipeDirectionsText = sortedRecipies[indexPath.row].directions
            }
        }
    }
}


extension MasterTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!
        
        if searchTerm != "" {
            sortedRecipies = searchResults.sorted(by: { $0.title < $1.title })
            searchResults.removeAll()
        } else {
            sortedRecipies = recipies.sorted(by: { $0.title < $1.title })
        }
        
        for recipe in recipies {
            if recipe.title.lowercased().range(of: searchTerm.lowercased()) != nil {
                searchResults.append(recipe)
            }
        }
        
        tableView.reloadData()
    }
}
