//
//  Recipe.swift
//  RecipeFinder
//
//  Created by Micah A. Walles on 6/7/24.
//

import Foundation

struct RecipeDetail {
	let id: String
	let name: String
	let area: String
	let instructions: String
	let category: String
	let tags: String?
	let thumbnailURL: String
	let youtube: String
	let ingredients: [Ingredient]
	let source: String?
}

// Since this API is read-only, I'm only using `Decodable` here. If this was a read/write API Then I would use MVVM.
// This Model would be the View-Model, and there would be another model that would be exactly how the API is setup.
// Then I would have methods for converting between the two models.
extension RecipeDetail: Decodable {
	enum CodingKeys: CodingKey {
		case id
		case name
		case area
		case instructions
		case category
		case tags
		case thumbnailURL
		case youtube
		case ingredients
		case source
		case ingredient(Int)
		case measure(Int)

		init?(stringValue: String) {
			return nil
		}

		init?(intValue: Int) {
			return nil
		}

		var intValue: Int? {
			return switch self {
				case .id:
					1
				case .name:
					2
				case .area:
					3
				case .instructions:
					4
				case .category:
					5
				case .tags:
					6
				case .thumbnailURL:
					7
				case .youtube:
					8
				case .ingredients:
					9
				case .source:
					10
				case .ingredient(let value):
					value+10
				case .measure(let value):
					value+10
			}
		}

		var stringValue: String {
			return switch self {
				case .id:
					"idMeal"
				case .name:
					"strMeal"
				case .area:
					"strArea"
				case .instructions:
					"strInstructions"
				case .category:
					"strCategory"
				case .tags:
					"strTags"
				case .thumbnailURL:
					"strMealThumb"
				case .youtube:
					"strYoutube"
				case .ingredients:
					"ingredients"
				case .source:
					"strSource"
				case .ingredient(let value):
					"strIngredient\(value)"
				case .measure(let value):
					"strMeasure\(value)"
			}
		}
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		id = try values.decode(String.self, forKey: .id)
		name = try values.decode(String.self, forKey: .name)
		area = try values.decode(String.self, forKey: .area)
		instructions = try values.decode(String.self, forKey: .instructions)
		category = try values.decode(String.self, forKey: .category)
		tags = try values.decode(String?.self, forKey: .tags)
		thumbnailURL = try values.decode(String.self, forKey: .thumbnailURL)
		youtube = try values.decode(String.self, forKey: .youtube)
		source = try values.decode(String?.self, forKey: .source)

		var ingredients = [Ingredient]()
		for index in 1...20 {
			let name = try values.decode(String?.self, forKey: .ingredient(index))?.trimmingCharacters(in: .whitespaces)
			let measurement = try values.decode(String?.self, forKey: .measure(index))?.trimmingCharacters(in: .whitespaces)
			guard let name, let measurement else {
				continue
			}
			if name.isEmpty || measurement.isEmpty {
				continue
			}

			ingredients.append(Ingredient(name: name,
										  measurement: measurement))
		}
		self.ingredients = ingredients
	}
}

extension RecipeDetail: Equatable {
	static func == (lhs: RecipeDetail, rhs: RecipeDetail) -> Bool {
		return lhs.id == rhs.id &&
			   lhs.name == rhs.name &&
			   lhs.area == rhs.area &&
			   lhs.instructions == rhs.instructions &&
			   lhs.category == rhs.category &&
			   lhs.tags == rhs.tags &&
			   lhs.thumbnailURL == rhs.thumbnailURL &&
			   lhs.youtube == rhs.youtube &&
			   lhs.ingredients == rhs.ingredients &&
			   lhs.source == rhs.source
	}
}
