//
//  TransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Transaction Request")
struct TransactionRequestTests {
    @Test("Path includes budget ID and transaction ID")
    func transactionRequest() {
        let request = TransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactionId: "c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/c36fbd68-131e-4ea8-b30f-94f43423021c")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
