//
//  ContentView.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/7/24.
//

import SwiftUI

struct ContentView: View {
	var recipeAPI: RecipeAPIProtocol = RecipeAPI.shared
	@State var recipes: [Recipe]? = nil
	@State var errorMessage: String? = nil
	let category = "Dessert"
	var body: some View {
		NavigationStack {
			if let recipes {
				List {
					ForEach(recipes) { recipe in
						NavigationLink(recipe.name, value: recipe.id)
					}
				}
				.navigationDestination(for: String.self) { textValue in
					DetailView(recipeID: textValue)
				}
				.navigationTitle(category)
			} else if let errorMessage {
				VStack {
					Text("An error occured").font(.largeTitle)
					Text(errorMessage).font(.caption)
					Button {
						load()
					} label: {
						Text("Retry")
					}
				}
			} else {
				LoadingView()
			}
		}.onAppear {
			load()
		}
	}
	
	func load() {
		Task {
			recipes = nil
			errorMessage = nil
			do {
				recipes = try await recipeAPI.getRecipes(forCategory: category).sorted { lhs, rhs in
					lhs.name < rhs.name
				}
			} catch {
				
				errorMessage = error.localizedDescription
			}
		}
	}
}

#Preview {
	ContentView(recipeAPI: RecipeAPIMock.shared)
}
