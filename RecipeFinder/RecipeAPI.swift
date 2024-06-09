//
//  RecipeAPI.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/8/24.
//

import Foundation

protocol RecipeAPIProtocol {
	func getRecipes(forCategory category: String) async throws -> [Recipe]
	func getRecipe(forID id: String) async throws -> RecipeDetail
}

struct RecipeAPI: RecipeAPIProtocol {
	static let baseAPI = "https://themealdb.com/api/json/v1/1/"

	private init() { }
	
	static let shared = RecipeAPI()

	func getRecipes(forCategory category: String) async throws -> [Recipe] {
		guard let url = URL(string: "\(RecipeAPI.baseAPI)filter.php?c=\(category)") else {
			throw RecipeAPIError.urlError
		}
		let (data, _) = try await URLSession.shared.data(from: url)
		let wrapper = try JSONDecoder().decode(RecipeWrapper.self, from: data)
		return wrapper.meals
	}

	func getRecipe(forID id: String) async throws -> RecipeDetail {
		guard let url = URL(string: "\(RecipeAPI.baseAPI)lookup.php?i=\(id)") else {
			throw RecipeAPIError.urlError
		}
		let (data, _) = try await URLSession.shared.data(from: url)
		let wrapper = try JSONDecoder().decode(RecipeDetailWrapper.self, from: data)
		guard let recipe = wrapper.meals.first else {
			throw RecipeAPIError.recipeNotFound
		}
		return recipe
	}

}
//MEAL_ID
enum RecipeAPIError: Error {
	case urlError
	case recipeNotFound
}
