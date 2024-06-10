//
//  RecipeListLabelView.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/9/24.
//

import SwiftUI

struct RecipeListLabelView: View {
	let name: String
	let url: String

	var body: some View {
		HStack {
			AsyncImage(url: URL(string: url)) { phase in
				if let image = phase.image {
					image.resizable()
						.aspectRatio(contentMode: .fit)
				} else if phase.error != nil {
					Image(systemName: "circle.slash")
				} else {
					ProgressView()
				}
			}
			.frame(width: 50, height: 50)
			.background(Color.mint)
			.clipShape(.circle)
			Text(name)
			Spacer()
		}
	}
}

#Preview {
	RecipeListLabelView(name: "Test", url: "")
}
