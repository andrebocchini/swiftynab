//
//  CreateTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CreateTransactionRequestTests: XCTestCase {
    func testCreateTransactionRequest() {
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

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)

        // Verify the body contains the wrapper with transaction field
        if let body = request.body {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let wrapper = try decoder.decode(CreateTransactionRequestWrapper.self, from: body)
                XCTAssertEqual(wrapper.transaction.accountId, "account_id")
                XCTAssertEqual(wrapper.transaction.payeeName, "Test Payee")
                XCTAssertEqual(wrapper.transaction.amount, 1000)
            } catch {
                XCTFail("Failed to decode wrapper: \(error)")
            }
        } else {
            XCTFail("Request body should not be nil")
        }
    }
}
