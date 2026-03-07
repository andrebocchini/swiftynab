//
//  AccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Account Request") struct AccountRequestTests {
    @Test("Path includes budget ID and account ID") func account() {
        let request = AccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/f9574c30-0614-7880-e926-0ae2c2f6d990")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
