//
//  ImportTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class ImportTransactionsRequestTests: XCTestCase {
    func testImportTransactionsRequest() {
        let request = ImportTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99"
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/import"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
