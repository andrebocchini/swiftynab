//
//  PayeeLocationsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Payee Locations Request") struct PayeeLocationsRequestTests {
    @Test("Path includes budget ID for listing payee locations") func payeeLocationsRequest() {
        let request = PayeeLocationsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payee_locations")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
