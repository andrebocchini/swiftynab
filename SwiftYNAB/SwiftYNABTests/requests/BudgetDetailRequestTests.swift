//
//  BudgetDetailRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class BudgetDetailRequestTests: XCTestCase {
    func testBudgetDetailRequestWithLastKnowledge() {
        let request = BudgetDetailRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            lastKnowledgeOfServer: 100
        )
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.query?.count, 1)
        XCTAssertEqual(
            request.query?[0],
            URLQueryItem(name: "last_knowledge_of_server", value: "100")
        )
        XCTAssertNil(request.body)
    }

    func testBudgetDetailRequest() {
        let request = BudgetDetailRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
