import Foundation
import Testing
@testable import SwiftYNAB

@Suite("OpenAPI 1.86 Compatibility")
struct OpenAPI186CompatibilityTests {
    @Test("Category decodes the required internal field")
    func categoryDecodesInternalField() throws {
        let category = try decode186(Category.self, from: """
        {
          "id": "category-id",
          "category_group_id": "group-id",
          "name": "Ready to Assign",
          "hidden": false,
          "internal": true,
          "budgeted": 0,
          "activity": 0,
          "balance": 0,
          "deleted": false
        }
        """)

        #expect(category.internal)
    }

    @Test("CategoryGroup decodes the required internal field")
    func categoryGroupDecodesInternalField() throws {
        let categoryGroup = try decode186(CategoryGroup.self, from: """
        {
          "id": "group-id",
          "name": "Internal Master Category",
          "hidden": false,
          "internal": true,
          "deleted": false
        }
        """)

        #expect(categoryGroup.internal)
    }

    @Test("CategoryGroupWithCategories decodes internal fields on the group and categories")
    func categoryGroupWithCategoriesDecodesInternalFields() throws {
        let categoryGroup = try decode186(CategoryGroupWithCategories.self, from: """
        {
          "id": "group-id",
          "name": "Internal Master Category",
          "hidden": false,
          "internal": true,
          "deleted": false,
          "categories": [
            {
              "id": "category-id",
              "category_group_id": "group-id",
              "name": "Ready to Assign",
              "hidden": false,
              "internal": true,
              "budgeted": 0,
              "activity": 0,
              "balance": 0,
              "deleted": false
            }
          ]
        }
        """)

        #expect(categoryGroup.internal)
        #expect(categoryGroup.categories.first?.internal == true)
    }

    @Test("Category rejects a payload without the required internal field")
    func categoryRequiresInternalField() throws {
        #expect(throws: SwiftYNABError.decodingFailure(message: "Missing internal field")) {
            try decode186(Category.self, from: """
            {
              "id": "category-id",
              "category_group_id": "group-id",
              "name": "Groceries",
              "hidden": false,
              "budgeted": 0,
              "activity": 0,
              "balance": 0,
              "deleted": false
            }
            """)
        }
    }
}

private func decode186<T: Decodable>(_ type: T.Type, from json: String) throws -> T {
    let serializer = Serializer()
    let data = try #require(json.data(using: .utf8))
    return try serializer.decode(type, from: data)
}
