//
//  UpdateTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Update Transaction Request") struct UpdateTransactionRequestTests {
    @Test("Request uses PUT method with transaction data in body") func updateTransactionRequest() {
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

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/transaction_id")
        #expect(request.method == .put)
        #expect(request.query == nil)
        #expect(request.body != nil)
    }
}
