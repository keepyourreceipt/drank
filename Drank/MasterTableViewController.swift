//
//  MasterTableViewController.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    // MARK - Init class variables
    let searchController = UISearchController(searchResultsController: nil)
    
    var sortedRecipies = [Recipe]()
    var searchResults = [Recipe]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        sortedRecipies = recipies.sorted(by: { $0.title < $1.title })
        tableView.reloadData()
    }
    
    
    // MARK - Setup table data and search controller on load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        // Set table view header styles
        navigationController?.navigationBar.barTintColor = UIColor(red:0.05, green:0.68, blue:0.60, alpha:1.0)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.layer.shadowRadius = 0
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        // Set searchbar styles
        searchController.searchBar.barTintColor = UIColor(red:0.05, green:0.68, blue:0.60, alpha:1.0)
        searchController.searchBar.layer.borderWidth = 5
        searchController.searchBar.layer.borderColor = UIColor(red:0.05, green:0.68, blue:0.60, alpha:1.0).cgColor
        
        
        let attributes = [
            NSForegroundColorAttributeName : UIColor.white,
            NSFontAttributeName : UIFont.systemFont(ofSize: 17)
        ]
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        
        let image = UIImage(named: "drankLogo")
        navigationItem.titleView = UIImageView(image: image)
        
        
    }
    
    
    
    // MARK - Create table view cells and display data
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
    
    
    
    // MARK - Setup detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            if let detailViewController = destination {
                detailViewController.recipeTitleText = sortedRecipies[indexPath.row].title
                detailViewController.recipeImageName = sortedRecipies[indexPath.row].imageName
                detailViewController.recipeDirectionsText = sortedRecipies[indexPath.row].directions
            }
        }
        
        // TO DO: Resolve table reload flash
        searchController.isActive = false
    }
}



// MARK - Define search functionality
extension MasterTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!
        
        for recipe in recipies {
            if recipe.title.lowercased().range(of: searchTerm.lowercased()) != nil {
                searchResults.append(recipe)
            }
        }
        
        if searchTerm != "" {
            sortedRecipies = searchResults.sorted(by: { $0.title < $1.title })
            searchResults.removeAll()
        } else if searchController.isActive == true {
            sortedRecipies = recipies.sorted(by: { $0.title < $1.title })
        }
        
        tableView.reloadData()
    }
}
