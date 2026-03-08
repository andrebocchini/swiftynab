//
//  ScheduledTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Scheduled Transactions Request")
struct ScheduledTransactionsRequestTests {
    @Test("Request targets scheduled transactions endpoint with GET method")
    func scheduledTransactionsRequest() {
        let request = ScheduledTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            lastKnowledgeOfServer: nil
        )

        #expect(request
            .path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
