import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Save Category")
struct SaveCategoryTests {
    @Test("Initializer stores goalNeedsWholeAmount and encoding uses snake case")
    func goalNeedsWholeAmountEncodes() throws {
        let category = SaveCategory(
            name: "Groceries",
            categoryGroupId: "group-id",
            goalTarget: 10000,
            goalTargetDate: "2026-05-01",
            goalNeedsWholeAmount: true
        )

        #expect(category.goalNeedsWholeAmount == true)

        let serializer = Serializer()
        let encoded = try serializer.encode(category)
        let json = try #require(String(data: encoded, encoding: .utf8))

        #expect(json.contains("\"goal_needs_whole_amount\" : true"))
    }
}
