//
//  TransactionsByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
import Foundation
@testable import SwiftYNAB

@Suite("Transactions By Month Request") struct TransactionsByMonthRequestTests {
    @Test("Path includes budget ID and month with no query parameters") func transactionsByMonthRequestNoQuery() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = dateFormatter.date(from: "2025-01-01")!
        let request = TransactionsByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: month
        )

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2025-01-01/transactions")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }

    @Test("Request includes since date, type, and last knowledge as query parameters") func transactionsByMonthRequestWithQuery() {
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

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2025-01-01/transactions")
        #expect(request.method == .get)
        #expect(request.query != nil)
        #expect(request.body == nil)

        let query = request.query!
        #expect(query.contains { $0.name == "since_date" && $0.value == "2025-01-15" })
        #expect(query.contains { $0.name == "type" && $0.value == "uncategorized" })
        #expect(query.contains { $0.name == "last_knowledge_of_server" && $0.value == "123" })
    }
}
