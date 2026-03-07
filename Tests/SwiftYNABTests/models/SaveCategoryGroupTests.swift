import XCTest
@testable import SwiftYNAB

class SaveCategoryGroupTests: XCTestCase {
    func testNameUnderLimit() {
        let group = SaveCategoryGroup(name: "Groceries")
        XCTAssertEqual(group.name, "Groceries")
    }

    func testNameAtLimit() {
        let name = String(repeating: "a", count: 50)
        let group = SaveCategoryGroup(name: name)
        XCTAssertEqual(group.name, name)
    }

    func testNameOverLimitIsTruncated() {
        let name = String(repeating: "a", count: 51)
        let group = SaveCategoryGroup(name: name)
        XCTAssertEqual(group.name.count, 50)
    }
}
