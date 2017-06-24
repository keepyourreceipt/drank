//
//  RecipeDataSource.swift
//  Drank
//
//  Created by Michael Peterman on 6/24/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class RecipeDataSource: NSObject, UITableViewDataSource {
    
    // MARK - Data source for recipies
    
    struct Recipe {
        let title: String
        let imageName: String
        let ingredients: [String]
        let directions: String
    }
    
    let recipies = [
        Recipe(title: "Rum and Coke", imageName: "rumandcoke", ingredients: ["Rum", "Coke"], directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Recipe(title: "Rum Runner", imageName: "rumrunner", ingredients: ["Rum", "Juice", "Other stuff"], directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut."),
        Recipe(title: "Tom Colins", imageName: "rumandcoke", ingredients: ["Rum", "Coke"], directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Recipe(title: "Long Island Iced Tea", imageName: "rumandcoke", ingredients: ["Rum", "Coke"], directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Recipe(title: "Mint Julip", imageName: "rumandcoke", ingredients: ["Rum", "Coke"], directions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ]
    
    
    // MARK - Table view structure
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath)
        
        cell.textLabel?.text = recipies[indexPath.row].title
        
        return cell
    }
}

