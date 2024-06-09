//
//  IngredientView.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/9/24.
//

import SwiftUI

struct IngredientView: View {
	let ingredient: Ingredient
    var body: some View {
		HStack {
			Image(systemName: "circle.fill").font(.caption)
			Text(ingredient.name)
			Text(ingredient.measurement)
			Spacer()
		}
    }
}

#Preview {
    IngredientView(ingredient: Ingredient(name: "flour", measurement: "2 cups"))
}
