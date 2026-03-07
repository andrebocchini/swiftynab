import XCTest
@testable import SwiftYNAB

class SavePayeeTests: XCTestCase {
    func testNameUnderLimit() {
        let payee = SavePayee(name: "Coffee Shop")
        XCTAssertEqual(payee.name, "Coffee Shop")
    }

    func testNameAtLimit() {
        let name = String(repeating: "a", count: 500)
        let payee = SavePayee(name: name)
        XCTAssertEqual(payee.name, name)
    }

    func testNameOverLimitIsTruncated() {
        let name = String(repeating: "a", count: 501)
        let payee = SavePayee(name: name)
        XCTAssertEqual(payee.name.count, 500)
    }
}
