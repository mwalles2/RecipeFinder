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
					AsyncImage(url: URL(string: recipeDetail.thumbnailURL)) { phase in
						if let image = phase.image {
							image.resizable()
								.aspectRatio(contentMode: .fill)
						} else if phase.error != nil {
							Image(systemName: "circle.slash")
						} else {
							ProgressView()
						}
					}
					.frame(width: 350, height: 200)
					.background(Color.mint)
					.clipShape(.rect)

					if let source = recipeDetail.source, let sourceURL = URL(string: source) {
						HStack {
							Link("Source", destination: sourceURL)
							Spacer()
						}
					}
					if let youtubeURL = URL(string: recipeDetail.youtube) {
						HStack {
						Link("YouTube", destination: youtubeURL)
							Spacer()
						}
					}

					Text(recipeDetail.instructions).padding(.bottom)
					ForEach(recipeDetail.ingredients, id: \.self) { ingredient in
						IngredientView(ingredient: ingredient)
					}
				}
				.padding()
				.navigationTitle(recipeDetail.name)
			}
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
