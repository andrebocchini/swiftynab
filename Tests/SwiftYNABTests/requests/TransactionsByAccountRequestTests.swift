//
//  TransactionsByAccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
import Foundation
@testable import SwiftYNAB

@Suite("Transactions By Account Request") struct TransactionsByAccountRequestTests {
    @Test("Path includes budget ID and account ID with no query parameters") func accountTransactionsNoQuery() {
        let request = TransactionsByAccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            accountId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }

    @Test("Request includes since date, type, and last knowledge as query parameters") func accountTransactionsWithQuery() {
        let date = Date(timeIntervalSince1970: 1_556_717_342.216656)
        let request = TransactionsByAccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            accountId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            sinceDate: date,
            type: .uncategorized,
            lastKnowledgeOfServer: 100
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions")
        #expect(request.method == .get)
        #expect(request.query?.count == 3)
        #expect(request.query?[0] == URLQueryItem(name: "since_date", value: "2019-05-01"))
        #expect(request.query?[1] == URLQueryItem(name: "type", value: "uncategorized"))
        #expect(request.query?[2] == URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        #expect(request.body == nil)
    }
}
