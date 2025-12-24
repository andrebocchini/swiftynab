//
//  TransactionsByAccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class TransactionsByAccountRequestTests: XCTestCase {
    func testAccountTransactionsNoQuery() {
        let request = TransactionsByAccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            accountId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99"
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }

    func testAccountTransactionsWithQuery() {
        let date = Date(timeIntervalSince1970: 1_556_717_342.216656)
        let request = TransactionsByAccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            accountId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            sinceDate: date,
            type: .uncategorized,
            lastKnowledgeOfServer: 100
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.query?.count, 3)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "since_date", value: "2019-05-01"))
        XCTAssertEqual(request.query?[1], URLQueryItem(name: "type", value: "uncategorized"))
        XCTAssertEqual(
            request.query?[2],
            URLQueryItem(name: "last_knowledge_of_server", value: "100")
        )
        XCTAssertNil(request.body)
    }
}
