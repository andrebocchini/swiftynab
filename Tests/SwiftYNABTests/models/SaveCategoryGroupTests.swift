import Testing
@testable import SwiftYNAB

@Suite("Save Category Group") struct SaveCategoryGroupTests {
    @Test("Name under the character limit is preserved as-is") func nameUnderLimit() {
        let group = SaveCategoryGroup(name: "Groceries")
        #expect(group.name == "Groceries")
    }

    @Test("Name exactly at the character limit is preserved as-is") func nameAtLimit() {
        let name = String(repeating: "a", count: 50)
        let group = SaveCategoryGroup(name: name)
        #expect(group.name == name)
    }

    @Test("Name exceeding the character limit is truncated to 50 characters") func nameOverLimitIsTruncated() {
        let name = String(repeating: "a", count: 51)
        let group = SaveCategoryGroup(name: name)
        #expect(group.name.count == 50)
    }
}
