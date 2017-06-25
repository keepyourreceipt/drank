//
//  SearchRecultsDataSource.swift
//  Drank
//
//  Created by Michael Peterman on 6/25/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class SearchRecultsDataSource: NSObject, UITableViewDataSource {
    
    let recipeDataSource = RecipeDataSource()
    var searchResults = RecipeDataSource().recipies
    
    // MARK - Setup table view structure and create cells
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsTableCell", for: indexPath)
        
        let cellLabel = cell.viewWithTag(2) as! UILabel
        cellLabel.text = "This is a label"
        
        return cell
    }
    
}
