//
//  SearchTableViewController.swift
//  Drank
//
//  Created by Michael Peterman on 6/25/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    let recipeDataSource = RecipeDataSource()
    var recipies = RecipeDataSource().recipies
    
    let searchResultsDataSource = SearchRecultsDataSource()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = searchController.searchBar
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = searchResultsDataSource
        
    }
}


extension SearchTableViewController: UISearchResultsUpdating {
    
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
