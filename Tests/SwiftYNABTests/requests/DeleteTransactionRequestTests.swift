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

@Suite("Delete Transaction Request") struct DeleteTransactionRequestTests {
    @Test("Request uses DELETE method with transaction path") func deleteTransactionRequest() throws {
        let request = DeleteTransactionRequest(
            budgetId: "budget_id",
            transactionId: "transaction_id"
        )

        #expect(request.method == .delete)
        #expect(request.body == nil)
        #expect(request.path == "/v1/budgets/budget_id/transactions/transaction_id")
    }
}
