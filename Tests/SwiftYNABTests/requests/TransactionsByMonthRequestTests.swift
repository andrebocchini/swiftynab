//
//  TransactionsByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class TransactionsByMonthRequestTests: XCTestCase {
    func testTransactionsByMonthRequestNoQuery() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = dateFormatter.date(from: "2025-01-01")!
        let request = TransactionsByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: month
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2025-01-01/transactions"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }

    func testTransactionsByMonthRequestWithQuery() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = dateFormatter.date(from: "2025-01-01")!
        let sinceDate = dateFormatter.date(from: "2025-01-15")!
        let request = TransactionsByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: month,
            sinceDate: sinceDate,
            type: .uncategorized,
            lastKnowledgeOfServer: 123
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2025-01-01/transactions"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNotNil(request.query)
        XCTAssertNil(request.body)

        let query = request.query!
        XCTAssertTrue(query.contains { $0.name == "since_date" && $0.value == "2025-01-15" })
        XCTAssertTrue(query.contains { $0.name == "type" && $0.value == "uncategorized" })
        XCTAssertTrue(query.contains { $0.name == "last_knowledge_of_server" && $0.value == "123" })
    }
}
