//
//  DeleteTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 4/12/23.
//  Copyright © 2023 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Delete Transaction Request")
struct DeleteTransactionRequestTests {
    @Test("Request uses DELETE method with transaction path")
    func deleteTransactionRequest() throws {
        let request = DeleteTransactionRequest(
            planId: "budget_id",
            transactionId: "transaction_id"
        )

        #expect(request.method == .delete)
        #expect(request.body == nil)
        #expect(request.path == "/v1/plans/budget_id/transactions/transaction_id")
    }

    @Test("Response decodes transaction with server knowledge")
    func deleteTransactionResponse() throws {
        let data = Data(
            """
            {
              "server_knowledge": 654,
              "transaction": {
                "id": "transaction_id",
                "date": "2025-01-01",
                "amount": 0,
                "cleared": "cleared",
                "approved": true,
                "account_id": "account_id",
                "account_name": "Checking",
                "deleted": true,
                "subtransactions": []
              }
            }
            """.utf8
        )

        let response = try Serializer().decode(DeleteTransactionRequest.Response.self, from: data)

        #expect(response.serverKnowledge == 654)
        #expect(response.transaction.id == "transaction_id")
    }
}
