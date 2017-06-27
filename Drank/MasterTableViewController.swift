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
        return recipies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath)
        
        let cellLabel = cell.viewWithTag(1) as? UILabel
        if let label = cellLabel {
            label.text = recipies[indexPath.row].title
        }
        
        return cell
    }
    
    
    // MARK: - View Navigation
    // TO DO: resolve incorrect details page loading on click after search
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Recipe {

        let selectedCell = Recipe(title: recipies[indexPath.row].title, imageName: recipies[indexPath.row].imageName, ingredients: recipies[indexPath.row].ingredients,directions: recipies[indexPath.row].directions)
        
        return selectedCell
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


extension MasterTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!
        
        for recipe in recipies {
            if recipe.title.lowercased().range(of: searchTerm.lowercased()) != nil {
                print("Found in recipies")
            }
        }
        
        // tableView.reloadData()
    }
}
