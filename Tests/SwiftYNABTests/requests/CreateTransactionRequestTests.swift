//
//  CreateTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
import Foundation
@testable import SwiftYNAB

@Suite("Create Transaction Request") struct CreateTransactionRequestTests {
    @Test("Request body contains transaction data and uses POST method") func createTransactionRequest() throws {
        let transaction = SaveTransactionWithIdOrImportId(
            id: nil,
            importId: nil,
            accountId: "account_id",
            date: "2025-01-01",
            amount: 1000,
            payeeId: "payee_id",
            payeeName: "Test Payee",
            categoryId: "category_id",
            memo: "Test transaction",
            cleared: nil,
            approved: nil,
            flagColor: nil,
            subtransactions: nil
        )

        let request = CreateTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transaction: transaction
        )

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let body = try #require(request.body)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let wrapper = try decoder.decode(CreateTransactionRequestWrapper.self, from: body)
        #expect(wrapper.transaction.accountId == "account_id")
        #expect(wrapper.transaction.payeeName == "Test Payee")
        #expect(wrapper.transaction.amount == 1000)
    }
}
