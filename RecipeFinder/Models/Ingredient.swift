//
//  Ingredient.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/7/24.
//

import Foundation

struct Ingredient {
	let name: String
	let measurement: String
}

extension Ingredient: Decodable {}

extension Ingredient: Equatable {}

extension Ingredient: Hashable {}
