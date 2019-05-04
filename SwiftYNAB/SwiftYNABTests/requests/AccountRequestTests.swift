//
//  AccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class AccountsRequestTests: XCTestCase {
    
    func testAccountsNoQuery() {
        let request = AccountsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testAccountsWithQuery() {
        let request = AccountsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                      lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 1)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }

}
