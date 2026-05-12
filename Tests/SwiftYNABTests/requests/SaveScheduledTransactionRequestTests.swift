//
//  SaveScheduledTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Save Scheduled Transaction Request")
struct SaveScheduledTransactionRequestTests {
    @Test("Creating a scheduled transaction uses POST method")
    func saveScheduledTransactionRequestCreate() throws {
        let transaction = try SaveScheduledTransaction(
            accountId: "account_id",
            date: scheduledTransactionDate(),
            amount: 1000,
            payeeId: "payee_id",
            payeeName: "Test Payee",
            categoryId: "category_id",
            memo: "Test scheduled transaction",
            flagColor: nil,
            frequency: "monthly"
        )

        let request = SaveScheduledTransactionRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transaction: transaction,
            update: false
        )

        #expect(request
            .path == "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let body = try #require(request.body)
        let object = try requestBodyJSONObject(from: body)
        let scheduledTransaction = try #require(object["scheduled_transaction"] as? [String: Any])
        let encodedDate = scheduledTransaction["date"]
        #expect(encodedDate as? String == "2026-05-12")
        #expect(encodedDate as? NSNumber == nil)
    }

    @Test("Updating a scheduled transaction uses PUT method with transaction ID in path")
    func saveScheduledTransactionRequestUpdate() throws {
        let transaction = try SaveScheduledTransaction(
            accountId: "account_id",
            date: scheduledTransactionDate(),
            amount: 1500,
            payeeId: "payee_id",
            payeeName: "Updated Test Payee",
            categoryId: "category_id",
            memo: "Updated scheduled transaction",
            flagColor: nil,
            frequency: "weekly"
        )

        let request = SaveScheduledTransactionRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transaction: transaction,
            update: true,
            scheduledTransactionId: "scheduled_tx_id"
        )

        // swiftlint:disable:next line_length

        #expect(request.path ==
            "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions/scheduled_tx_id")
        #expect(request.method == .put)
        #expect(request.query == nil)

        let body = try #require(request.body)
        let object = try requestBodyJSONObject(from: body)
        let scheduledTransaction = try #require(object["scheduled_transaction"] as? [String: Any])
        let encodedDate = scheduledTransaction["date"]
        #expect(encodedDate as? String == "2026-05-12")
        #expect(encodedDate as? NSNumber == nil)
    }
}

private func scheduledTransactionDate() throws -> Date {
    var components = DateComponents()
    components.calendar = Calendar(identifier: .gregorian)
    components.timeZone = TimeZone(secondsFromGMT: 0)
    components.year = 2026
    components.month = 5
    components.day = 12
    return try #require(components.date)
}
