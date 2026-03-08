//
//  DeleteScheduledTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Delete Scheduled Transaction Request")
struct DeleteScheduledTransactionRequestTests {
    @Test("Request uses DELETE method with scheduled transaction path")
    func deleteScheduledTransactionRequest() {
        let request = DeleteScheduledTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            scheduledTransactionId: "c36fbd68-131e-4ea8-b30f-94f43423021c"
        )

        // swiftlint:disable:next line_length

        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions/c36fbd68-131e-4ea8-b30f-94f43423021c")
        #expect(request.method == .delete)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
