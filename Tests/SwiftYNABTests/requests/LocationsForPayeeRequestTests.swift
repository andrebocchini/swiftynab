//
//  LocationsForPayeeRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Locations For Payee Request") struct LocationsForPayeeRequestTests {
    @Test("Path includes budget ID and payee ID for payee locations") func locationsForPayeeRequest() {
        let request = LocationsForPayeeRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            payeeId: "0bfe752a-89e1-65d4-73d4-0ae2c2f71d54"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees/0bfe752a-89e1-65d4-73d4-0ae2c2f71d54/payee_locations")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
