//
//  RecipeModelTests.swift
//  RecipeFinderTests
//
//  Created by Micah A. Walles on 6/7/24.
//

import XCTest
@testable import RecipeFinder

final class RecipeModelTests: XCTestCase {

    func testDecode() throws {
		guard let url = Bundle(for: RecipeModelTests.self).url(forResource: "TestRecipe", withExtension: "json") else {
			XCTFail()
			return
		}
		guard let data = try? Data(contentsOf: url) else {
			XCTFail()
			return
		}

		guard let wrapper = try? JSONDecoder().decode(RecipeDetailWrapper.self, from: data) else {
			XCTFail()
			return
		}

		guard let decodedRecipe = wrapper.meals.first else {
			XCTFail()
			return
		}

		XCTAssertEqual(RecipeAPIMock.shared.testRecipe(), decodedRecipe)
    }
}
