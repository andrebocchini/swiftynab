//
//  ImportTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Import Transactions Request") struct ImportTransactionsRequestTests {
    @Test("Request uses POST method with import transactions path") func importTransactionsRequest() {
        let request = ImportTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99"
        )

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/import")
        #expect(request.method == .post)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
