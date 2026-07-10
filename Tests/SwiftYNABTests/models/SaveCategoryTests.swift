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
            goalNeedsWholeAmount: true,
            goalFrequency: .monthly
        )

        #expect(category.goalNeedsWholeAmount == true)
        #expect(category.goalTarget == 10000)
        #expect(category.goalTargetUpdate == .set(10000))

        let serializer = Serializer()
        let encoded = try serializer.encode(category)
        let json = try #require(String(data: encoded, encoding: .utf8))

        #expect(json.contains("\"goal_needs_whole_amount\" : true"))
        #expect(json.contains("\"goal_frequency\" : \"monthly\""))
    }

    @Test("Goal target updates encode as omitted, a value, or null")
    func goalTargetUpdatesEncode() throws {
        let unchanged = SaveCategory(goalTarget: nil)
        let set = SaveCategory(goalTargetUpdate: .set(25000))
        let remove = SaveCategory(goalTargetUpdate: .remove)

        #expect(unchanged.goalTarget == nil)
        #expect(unchanged.goalTargetUpdate == .unchanged)
        #expect(set.goalTarget == 25000)
        #expect(set.goalTargetUpdate == .set(25000))
        #expect(remove.goalTarget == nil)
        #expect(remove.goalTargetUpdate == .remove)

        let unchangedObject = try encodedJSONObject(unchanged)
        let setObject = try encodedJSONObject(set)
        let removeObject = try encodedJSONObject(remove)

        #expect(!unchangedObject.keys.contains("goal_target"))
        #expect(setObject["goal_target"] as? Int64 == 25000)
        #expect(removeObject.keys.contains("goal_target"))
        #expect(removeObject["goal_target"] is NSNull)
    }

    @Test("Goal target updates decode from omitted, value, and null fields")
    func goalTargetUpdatesDecode() throws {
        let serializer = Serializer()
        let unchanged = try serializer.decode(SaveCategory.self, from: Data("{}".utf8))
        let set = try serializer.decode(
            SaveCategory.self,
            from: Data(#"{"goal_target":25000}"#.utf8)
        )
        let remove = try serializer.decode(
            SaveCategory.self,
            from: Data(#"{"goal_target":null}"#.utf8)
        )

        #expect(unchanged.goalTargetUpdate == .unchanged)
        #expect(set.goalTargetUpdate == .set(25000))
        #expect(remove.goalTargetUpdate == .remove)
    }

    @Test("Goal frequency uses API raw values")
    func goalFrequencyRawValues() {
        #expect(CategoryGoalFrequency.monthly.rawValue == "monthly")
        #expect(CategoryGoalFrequency.weekly.rawValue == "weekly")
        #expect(CategoryGoalFrequency.yearly.rawValue == "yearly")
    }

    private func encodedJSONObject(_ category: SaveCategory) throws -> [String: Any] {
        let encoded = try Serializer().encode(category)
        let object = try JSONSerialization.jsonObject(with: encoded)
        return try #require(object as? [String: Any])
    }
}
