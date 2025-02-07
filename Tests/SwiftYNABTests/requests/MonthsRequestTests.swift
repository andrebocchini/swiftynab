//
//  MonthsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

import XCTest
@testable import SwiftYNAB

class MonthsRequestTests: XCTestCase {
    func testMonthsRequestNoLastKnowledge() {
        let request = MonthsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months")
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }

    func testMonthsRequestWithLastKnowledge() {
        let request = MonthsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            lastKnowledgeOfServer: 100
        )
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.query?.count, 1)
        XCTAssertEqual(
            request.query?[0],
            URLQueryItem(name: "last_knowledge_of_server", value: "100")
        )
        XCTAssertNil(request.body)
    }
}
