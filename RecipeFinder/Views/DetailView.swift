//
//  DetailView.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/8/24.
//

import SwiftUI

struct DetailView: View {
	let recipeID: String
	var recipeAPI: RecipeAPIProtocol = RecipeAPI.shared
	@State var recipeDetail: RecipeDetail? = nil
	@State var errorMessage: String? = nil
	var body: some View {
		if let recipeDetail {
			ScrollView {
				VStack{
					Text(recipeDetail.instructions).padding(.bottom)
					ForEach(recipeDetail.ingredients, id: \.self) { ingredient in
						IngredientView(ingredient: ingredient)
					}
				}
			}.padding().navigationTitle(recipeDetail.name)
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
			LoadingView().onAppear {
				load()
			}
		}
	}

	func load() {
		Task {
			recipeDetail = nil
			errorMessage = nil
			do {
				recipeDetail = try await recipeAPI.getRecipe(forID: recipeID)
			} catch {
				errorMessage = error.localizedDescription
			}
		}
	}
}

#Preview {
	DetailView(recipeID: "test", recipeAPI: RecipeAPIMock.shared)
}
