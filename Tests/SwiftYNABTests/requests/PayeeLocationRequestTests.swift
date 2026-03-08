//
//  PayeeLocationRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Payee Location Request")
struct PayeeLocationRequestTests {
    @Test("Path includes budget ID and payee location ID")
    func payeeLocationRequest() {
        let request = PayeeLocationRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            payeeLocationId: "0bfe752a-89e1-65d4-73d4-0ae2c2f71d54"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payee_locations/0bfe752a-89e1-65d4-73d4-0ae2c2f71d54")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
