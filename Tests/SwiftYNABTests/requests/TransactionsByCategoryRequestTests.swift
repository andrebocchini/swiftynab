//
//  TransactionsByCategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Transactions By Category Request")
struct TransactionsByCategoryRequestTests {
    @Test("Path includes plan ID and category ID with no query parameters")
    func categoryTransactionsNoQuery() throws {
        let request = TransactionsByCategoryRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryId: "cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc/transactions")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(try request.body(using: Serializer()) == nil)
    }

    @Test("Request includes both dates, type, and last knowledge as query parameters")
    func categoryTransactionsWithQuery() throws {
        let sinceDate = Date(timeIntervalSince1970: 1_556_717_342.216656)
        let untilDate = try #require(DateConverter.date(from: "2019-05-31"))
        let request = TransactionsByCategoryRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryId: "cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc",
            sinceDate: sinceDate,
            untilDate: untilDate,
            type: .uncategorized,
            lastKnowledgeOfServer: 100
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/cb6d13fc-dc85-f567-4e1f-0ae2c2f6d7bc/transactions")
        #expect(request.method == .get)
        #expect(request.query?.count == 4)
        #expect(request.query?[0] == URLQueryItem(name: "since_date", value: "2019-05-01"))
        #expect(request.query?[1] == URLQueryItem(name: "until_date", value: "2019-05-31"))
        #expect(request.query?[2] == URLQueryItem(name: "type", value: "uncategorized"))
        #expect(request.query?[3] == URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        #expect(try request.body(using: Serializer()) == nil)
    }

    @Test("Request can include only an until date")
    func categoryTransactionsWithOnlyUntilDate() throws {
        let untilDate = try #require(DateConverter.date(from: "2019-05-31"))
        let request = TransactionsByCategoryRequest(
            planId: "plan_id",
            categoryId: "category_id",
            untilDate: untilDate
        )

        #expect(request.query == [URLQueryItem(name: "until_date", value: "2019-05-31")])
    }

    @Test("Response decodes when optional server knowledge is omitted")
    func categoryTransactionsResponseWithoutServerKnowledge() throws {
        let data = Data(
            """
            {
              "transactions": [
                {
                  "type": "transaction",
                  "id": "transaction_id",
                  "date": "2025-01-01",
                  "amount": 1500,
                  "cleared": "cleared",
                  "approved": true,
                  "account_id": "account_id",
                  "account_name": "Checking",
                  "category_name": "Groceries",
                  "deleted": false
                }
              ]
            }
            """.utf8
        )

        let response = try Serializer()
            .decode(TransactionsByCategoryRequest.Response.self, from: data)

        #expect(response.transactions.count == 1)
        #expect(response.serverKnowledge == nil)
    }
}
