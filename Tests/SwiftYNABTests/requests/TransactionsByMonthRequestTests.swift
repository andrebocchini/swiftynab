//
//  TransactionsByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Transactions By Month Request")
struct TransactionsByMonthRequestTests {
    @Test("Path includes plan ID and month with no query parameters")
    func transactionsByMonthRequestNoQuery() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = dateFormatter.date(from: "2025-01-01")!
        let request = TransactionsByMonthRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: month
        )

        #expect(request
            .path ==
            "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2025-01-01/transactions")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(try request.body(using: Serializer()) == nil)
    }

    @Test("Request includes both dates, type, and last knowledge as query parameters")
    func transactionsByMonthRequestWithQuery() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let month = dateFormatter.date(from: "2025-01-01")!
        let sinceDate = dateFormatter.date(from: "2025-01-15")!
        let untilDate = dateFormatter.date(from: "2025-01-31")!
        let request = TransactionsByMonthRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: month,
            sinceDate: sinceDate,
            untilDate: untilDate,
            type: .uncategorized,
            lastKnowledgeOfServer: 123
        )

        #expect(request
            .path ==
            "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2025-01-01/transactions")
        #expect(request.method == .get)
        #expect(try request.body(using: Serializer()) == nil)
        #expect(request.query == [
            URLQueryItem(name: "since_date", value: "2025-01-15"),
            URLQueryItem(name: "until_date", value: "2025-01-31"),
            URLQueryItem(name: "type", value: "uncategorized"),
            URLQueryItem(name: "last_knowledge_of_server", value: "123")
        ])
    }

    @Test("Request can include only an until date")
    func transactionsByMonthRequestWithOnlyUntilDate() throws {
        let month = try #require(DateConverter.date(from: "2025-01-01"))
        let untilDate = try #require(DateConverter.date(from: "2025-01-31"))
        let request = TransactionsByMonthRequest(
            planId: "plan_id",
            month: month,
            untilDate: untilDate
        )

        #expect(request.query == [URLQueryItem(name: "until_date", value: "2025-01-31")])
    }

    @Test("Response decodes transaction details with required server knowledge")
    func transactionsByMonthResponse() throws {
        let data = Data(
            """
            {
              "server_knowledge": 123,
              "transactions": [
                {
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
              ]
            }
            """.utf8
        )

        let response = try Serializer().decode(TransactionsByMonthRequest.Response.self, from: data)

        #expect(response.serverKnowledge == 123)
        #expect(response.transactions.first?.accountName == "Checking")
    }
}
