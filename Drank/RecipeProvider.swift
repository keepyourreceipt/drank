//
//  RecipeProvider.swift
//  Drank
//
//  Created by Steve Gabriel on 6/16/17.
//  Copyright © 2017 Michael K Peterman. All rights reserved.
//

import Foundation

struct Recipe {
    let title: String
    let imageName: String
    let ingredients: [String]
    let directions: String
}

let recipies = [
    Recipe(title: "Rum and Coke", imageName: "rumandcoke", ingredients: ["Rum", "Coke"], directions: "Pour rum over ice in a highball glass, and stir in coke. Garnigh with Lime"),
    Recipe(title: "Rum Runner", imageName: "rumrunner", ingredients: ["Rum", "Juice", "Other stuff"], directions: "Mix everything up and server in a cool looking glass")
]
