//
//  DeleteTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 4/12/23.
//  Copyright © 2023 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class DeleteTransactionRequestTests: XCTestCase {
    func deleteTransactionRequest() throws {
        let request = DeleteTransactionRequest(
            budgetId: "budget_id",
            transactionId: "transaction_id"
        )

        let body = DeleteTransactionRequest.Body(
            budgetId: "budget_id",
            transactionId: "transaction_id"
        )
        let serializer = Serializer()
        let expectedBody = try XCTUnwrap(serializer.encode(body))

        XCTAssertEqual(request.method, .delete)
        XCTAssertEqual(request.body, expectedBody)
        XCTAssertEqual(request.path, "/v1/budgets/budget_id/transactions/transaction_id")
    }
}
