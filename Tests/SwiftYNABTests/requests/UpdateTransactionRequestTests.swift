//
//  UpdateTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class UpdateTransactionRequestTests: XCTestCase {
    func testUpdateTransactionRequest() {
        let transaction = SaveTransactionWithIdOrImportId(
            id: "transaction_id",
            importId: nil,
            accountId: "account_id",
            date: "2025-01-01",
            amount: 1500,
            payeeId: "payee_id",
            payeeName: "Updated Payee",
            categoryId: "category_id",
            memo: "Updated transaction",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )

        let request = UpdateTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactionId: "transaction_id",
            transaction: transaction
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/transaction_id"
        )
        XCTAssertEqual(request.method, .put)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)
    }
}
