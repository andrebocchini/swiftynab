import Testing
@testable import SwiftYNAB

@Suite("Save Payee") struct SavePayeeTests {
    @Test("Name under the character limit is preserved as-is") func nameUnderLimit() {
        let payee = SavePayee(name: "Coffee Shop")
        #expect(payee.name == "Coffee Shop")
    }

    @Test("Name exactly at the character limit is preserved as-is") func nameAtLimit() {
        let name = String(repeating: "a", count: 500)
        let payee = SavePayee(name: name)
        #expect(payee.name == name)
    }

    @Test("Name exceeding the character limit is truncated to 500 characters") func nameOverLimitIsTruncated() {
        let name = String(repeating: "a", count: 501)
        let payee = SavePayee(name: name)
        #expect(payee.name.count == 500)
    }
}
