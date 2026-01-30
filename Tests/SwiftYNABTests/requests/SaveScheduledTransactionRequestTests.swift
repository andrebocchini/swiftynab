//
//  SaveScheduledTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class SaveScheduledTransactionRequestTests: XCTestCase {
    func testSaveScheduledTransactionRequestCreate() {
        let transaction = SaveScheduledTransaction(
            accountId: "account_id",
            date: Date(),
            amount: 1000,
            payeeId: "payee_id",
            payeeName: "Test Payee",
            categoryId: "category_id",
            memo: "Test scheduled transaction",
            flagColor: nil,
            frequency: "monthly"
        )

        let request = SaveScheduledTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transaction: transaction,
            update: false
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)
    }

    func testSaveScheduledTransactionRequestUpdate() {
        let transaction = SaveScheduledTransaction(
            accountId: "account_id",
            date: Date(),
            amount: 1500,
            payeeId: "payee_id",
            payeeName: "Updated Test Payee",
            categoryId: "category_id",
            memo: "Updated scheduled transaction",
            flagColor: nil,
            frequency: "weekly"
        )

        let request = SaveScheduledTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transaction: transaction,
            update: true,
            scheduledTransactionId: "scheduled_tx_id"
        )

        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions/scheduled_tx_id"
        )
        XCTAssertEqual(request.method, .put)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)
    }
}
