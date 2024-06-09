//
//  Meal.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/7/24.
//

import Foundation

struct Recipe {
	let id: String
	let name: String
	let thumbnailURL: String
}

extension Recipe: Decodable {
	enum CodingKeys: String, CodingKey {
		case id = "idMeal"
		case name = "strMeal"
		case thumbnailURL = "strMealThumb"
	}
}

extension Recipe: Identifiable {
	
}
