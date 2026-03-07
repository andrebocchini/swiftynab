//
//  ScheduledTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Scheduled Transaction Request") struct ScheduledTransactionRequestTests {
    @Test("Path includes budget ID and scheduled transaction ID") func scheduledTransactionRequest() {
        let request = ScheduledTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactionId: "6aa65ae8-919d-481b-8bd0-6d125dc97016"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions/6aa65ae8-919d-481b-8bd0-6d125dc97016")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
