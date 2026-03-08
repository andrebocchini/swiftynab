//
//  UpdateTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Update Transactions Request")
struct UpdateTransactionsRequestTests {
    @Test("Request uses PATCH method with transaction body for bulk update")
    func updateTransactionsRequest() {
        let transaction1 = SaveTransactionWithIdOrImportId(
            id: "transaction_id_1",
            importId: nil,
            accountId: "account_id_1",
            date: "2025-01-01",
            amount: 1500,
            payeeId: "payee_id_1",
            payeeName: "Updated Payee 1",
            categoryId: "category_id_1",
            memo: "Updated transaction 1",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )

        let transaction2 = SaveTransactionWithIdOrImportId(
            id: "transaction_id_2",
            importId: nil,
            accountId: "account_id_2",
            date: "2025-01-02",
            amount: 2500,
            payeeId: "payee_id_2",
            payeeName: "Updated Payee 2",
            categoryId: "category_id_2",
            memo: "Updated transaction 2",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )

        let request = UpdateTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactions: [transaction1, transaction2]
        )

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        #expect(request.method == .patch)
        #expect(request.query == nil)
        #expect(request.body != nil)
    }
}
