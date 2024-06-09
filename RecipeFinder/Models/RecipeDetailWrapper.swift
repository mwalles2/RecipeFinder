//
//  RecipeWrapper.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/8/24.
//

import Foundation

struct RecipeDetailWrapper {
	let meals: [RecipeDetail]
}

extension RecipeDetailWrapper: Decodable { }
