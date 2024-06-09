//
//  LoadingView.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/9/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
		ProgressView {
			Text("Loading")
		}.font(.largeTitle)
    }
}

#Preview {
    LoadingView()
}
