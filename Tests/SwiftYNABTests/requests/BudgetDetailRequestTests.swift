//
//  BudgetDetailRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Testing
import Foundation
@testable import SwiftYNAB

@Suite("Budget Detail Request") struct BudgetDetailRequestTests {
    @Test("Request includes last knowledge of server query parameter") func budgetDetailRequestWithLastKnowledge() {
        let request = BudgetDetailRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            lastKnowledgeOfServer: 100
        )
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        #expect(request.method == .get)
        #expect(request.query?.count == 1)
        #expect(request.query?[0] == URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        #expect(request.body == nil)
    }

    @Test("Request omits query when no server knowledge provided") func budgetDetailRequest() {
        let request = BudgetDetailRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
