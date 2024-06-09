//
//  RecipeAPIMock.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/8/24.
//

import Foundation

struct RecipeAPIMock: RecipeAPIProtocol {
	private init() { }
	
	static let shared = RecipeAPIMock()
	
	func getRecipes(forCategory category: String) async throws -> [Recipe] {
		return [Recipe(id: "52893",
					   name: "Apple & Blackberry Crumble",
					   thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
				Recipe(id: "52833",
					   name: "Salted Caramel Cheescake",
					   thumbnailURL: "https://www.themealdb.com/images/media/meals/xqrwyr1511133646.jpg"),
				Recipe(id: "52917",
					   name: "White chocolate creme brulee",
					   thumbnailURL: "https://www.themealdb.com/images/media/meals/uryqru1511798039.jpg")]
	}
	
	func getRecipe(forID id: String) async throws -> RecipeDetail {
		return testRecipe()
	}
	
	func testRecipe() -> RecipeDetail {
		return RecipeDetail(id: "52833",
							name: "Salted Caramel Cheescake",
							area: "American",
							instructions: "1) Blitz the biscuits and the pretzels in a food processor and mix the biscuits with the melted butter. Spread on the bottom of an 8″/20cm Deep Springform Tin and press down firmly. Leave to set in the fridge whilst you make the rest!\r\n\r\n2) Using an electric mixer, I use my KitchenAid with the whisk attachment, whisk together the cream cheese, vanilla, and icing sugar until smooth and then add the caramel and whisk again until smooth and lump free – this could take a couple of minutes, I whisk it at half speed so not too quick or slow!\r\n\r\n3) Pour in the double cream & Salt flakes and continue to whisk for a couple of minutes until its very thick and mousse like (I mix it on a medium speed, level 6/10) – Now this could take up to 5 minutes depending on your mixer, but you seriously have to stick at it – it will hold itself completely when finished mixing (like a meringue does!) If you don’t mix it enough it will not set well enough, but don’t get impatient and whisk it really quick because that’ll make it split! Spread over the biscuit base and leave to set in the fridge overnight.\r\n\r\n4) Remove the Cheesecake from the tin carefully and decorate the cheesecake – I drizzled over some of the spare caramel, and then some Toffee Popcorn and more Pretzels!",
							category: "Dessert",
							tags: nil,
							thumbnailURL: "https://www.themealdb.com/images/media/meals/xqrwyr1511133646.jpg",
							youtube: "https://www.youtube.com/watch?v=q5dQp3qpmI4",
							ingredients: [Ingredient(name: "Digestive Biscuits", measurement: "250g"),
										  Ingredient(name: "Pretzels", measurement: "75g"),
										  Ingredient(name: "Butter", measurement: "135g"),
										  Ingredient(name: "Cream Cheese", measurement: "450g"),
										  Ingredient(name: "Vanilla Extract", measurement: "1tsp"),
										  Ingredient(name: "Icing Sugar", measurement: "100g"),
										  Ingredient(name: "Caramel", measurement: "150g"),
										  Ingredient(name: "Sea Salt", measurement: "1tsp"),
										  Ingredient(name: "Double Cream", measurement: "300ml"),
										  Ingredient(name: "Caramel Sauce", measurement: "drizzle"),
										  Ingredient(name: "Toffee Popcorn", measurement: "Top"),
										  Ingredient(name: "Pretzels", measurement: "Top")],
							source: "http://www.janespatisserie.com/2015/11/09/no-bake-salted-caramel-cheesecake/")
		
	}
}
