//
//  UpdateTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Update Transaction Request")
struct UpdateTransactionRequestTests {
    @Test("Request uses PUT method with transaction data in body")
    func updateTransactionRequest() throws {
        let transaction = ExistingTransaction(
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
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactionId: "transaction_id",
            transaction: transaction
        )

        #expect(request
            .path == "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/transaction_id")
        #expect(request.method == .put)
        #expect(request.query == nil)

        let body = try #require(request.body)
        let object = try requestBodyJSONObject(from: body)
        let encodedTransaction = try #require(object["transaction"] as? [String: Any])
        #expect(encodedTransaction["id"] == nil)
        #expect(encodedTransaction["import_id"] == nil)
    }

    @Test("Response decodes transaction with server knowledge")
    func updateTransactionResponse() throws {
        let data = Data(
            """
            {
              "server_knowledge": 321,
              "transaction": {
                "id": "transaction_id",
                "date": "2025-01-01",
                "amount": 1500,
                "cleared": "cleared",
                "approved": true,
                "account_id": "account_id",
                "account_name": "Checking",
                "deleted": false,
                "subtransactions": []
              }
            }
            """.utf8
        )

        let response = try Serializer().decode(UpdateTransactionRequest.Response.self, from: data)

        #expect(response.serverKnowledge == 321)
        #expect(response.transaction.id == "transaction_id")
    }
}
