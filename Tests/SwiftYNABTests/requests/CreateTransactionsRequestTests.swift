//
//  CreateTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Create Transactions Request")
struct CreateTransactionsRequestTests {
    @Test("Request uses POST method with multiple transactions in body")
    func createTransactionsRequest() throws {
        let transaction1 = NewTransaction(
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
            subtransactions: nil,
            importId: nil
        )

        let transaction2 = NewTransaction(
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
            subtransactions: nil,
            importId: "import_id_2"
        )

        let request = CreateTransactionsRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactions: [transaction1, transaction2]
        )

        #expect(request.path == "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let body = try #require(request.body)
        let object = try requestBodyJSONObject(from: body)
        let transactions = try #require(object["transactions"] as? [[String: Any]])
        let firstTransaction = try #require(transactions.first)
        let secondTransaction = try #require(transactions.dropFirst().first)
        #expect(firstTransaction["id"] == nil)
        #expect(secondTransaction["id"] == nil)
        #expect(secondTransaction["import_id"] as? String == "import_id_2")
    }
}
