//
//  RecipeFinderApp.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/7/24.
//

import SwiftUI

@main
struct RecipeFinderApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(recipeAPI: RecipeAPI.shared)
        }
    }
}
