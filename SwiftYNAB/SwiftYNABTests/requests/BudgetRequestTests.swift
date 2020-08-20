//
//  BudgetRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class BudgetsRequestTests: XCTestCase {
    
    func testBudgetSummaryRequest() {
        let request = BudgetSummaryRequest()
        XCTAssertEqual(request.path, "/v1/budgets")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testBudgetSettingsRequest() {
        let request = BudgetSettingsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/settings")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testBudgetDetailRequestWithLastKnowledge() {
        let request = BudgetDetailRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                          lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 1)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    func testBudgetDetailRequest() {
        let request = BudgetDetailRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testNewBudgetAccountRequest() {
        let request = NewBudgetAccountRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99", name: "name", type: "checking", balance: 0)
        
        let account = NewBudgetAccountRequestBody(name: "name", type: "checking", balance: 0)
        let wrapper = try! Serializer.encode(NewBudgetAccountRequestWrapper(account: account))
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts")
        XCTAssertEqual(request.method, "POST")
        XCTAssertNil(request.query)
        XCTAssertEqual(request.body, wrapper)
    }
    
}
