//
//  CreateTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CreateTransactionsRequestTests: XCTestCase {
    func testCreateTransactionsRequest() {
        let transaction1 = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id_1",
            date: "2025-01-01",
            amount: 1000,
            payeeId: "payee_id_1",
            payeeName: "Test Payee 1",
            categoryId: "category_id_1",
            memo: "Test transaction 1",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )

        let transaction2 = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id_2",
            date: "2025-01-02",
            amount: 2000,
            payeeId: "payee_id_2",
            payeeName: "Test Payee 2",
            categoryId: "category_id_2",
            memo: "Test transaction 2",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )

        let request = CreateTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactions: [transaction1, transaction2]
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)
    }
}
