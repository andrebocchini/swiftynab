//
//  BudgetSummaryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class BudgetsSummaryRequestTests: XCTestCase {
    func testBudgetSummaryRequest() {
        let request = BudgetSummaryRequest(includeAccounts: false)
        XCTAssertEqual(request.path, "/v1/budgets")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.query, [URLQueryItem(name: "include_accounts", value: "false")])
        XCTAssertNil(request.body)
    }
}
