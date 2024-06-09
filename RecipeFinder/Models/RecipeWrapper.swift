//
//  MealWrapper.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/8/24.
//

import Foundation

struct RecipeWrapper {
	let meals: [Recipe]
}

extension RecipeWrapper: Decodable { }
