//
//  DetailViewController.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    // MARK - Get references to interface elements and set default values
    @IBOutlet weak var recipeTitle: UILabel!
    var recipeTitleText: String = "Default recipe title"
    
    @IBOutlet weak var recipeImage: UIImageView!
    var recipeImageName: String = "rumandcoke"
    
    @IBOutlet weak var recipeDirections: UILabel!
    var recipeDirectionsText = "Default recipe directions"
    
    
    // MARK - Configure view on load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTitle.text = recipeTitleText
        recipeImage.image = UIImage.init(named: recipeImageName)

        recipeDirections.lineBreakMode = .byWordWrapping
        recipeDirections.numberOfLines = 0
        
        recipeDirections.text = recipeDirectionsText
        
    }
 
}
