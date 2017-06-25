//
//  SearchTableViewController.swift
//  Drank
//
//  Created by Michael Peterman on 6/25/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    let recipeDataSource = RecipeDataSource()
    let recipeReference = RecipeDataSource().recipies
    
    var searchResults = RecipeDataSource().recipies
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        searchResults.removeAll()
        searchController.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = searchController.searchBar
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = self
    }
    
    // MARK - Setup table view structure and create cells
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsTableCell", for: indexPath)
        
        let cellLabel = cell.viewWithTag(2) as! UILabel
        cellLabel.text = searchResults[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        searchController.isActive = false
    }
    
}


extension SearchTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!
        
        searchResults.removeAll()
        
        for recipe in recipeReference {
            if recipe.title.lowercased().range(of: searchTerm.lowercased()) != nil {
                searchResults.append(recipe)
            }
        }
        
        tableView.reloadData()
    }
}
