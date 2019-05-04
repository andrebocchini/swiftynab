//
//  PayeeRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class PayeeRequestTests: XCTestCase {
    
    func testPayeeRequest() {
        let request = PayeeRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                   payeeId: "e379b298-ec3f-74ce-5248-0ae2c2f74465")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees/e379b298-ec3f-74ce-5248-0ae2c2f74465")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testPayeesRequestWithKnowledge() {
        let request = PayeesRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                    lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 1)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    func testPayeesRequestNoKnowledge() {
        let request = PayeesRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
}
