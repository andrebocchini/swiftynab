//
//  MonthsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

import Testing
@testable import SwiftYNAB

@Suite("Months Request") struct MonthsRequestTests {
    @Test("Request has no query parameters without last knowledge of server") func monthsRequestNoLastKnowledge() {
        let request = MonthsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }

    @Test("Request includes last knowledge of server as query parameter") func monthsRequestWithLastKnowledge() {
        let request = MonthsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            lastKnowledgeOfServer: 100
        )
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months")
        #expect(request.method == .get)
        #expect(request.query?.count == 1)
        #expect(request.query?[0] == URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        #expect(request.body == nil)
    }
}
