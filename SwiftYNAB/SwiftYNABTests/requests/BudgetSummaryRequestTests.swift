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
        let request = BudgetSummaryRequest()
        XCTAssertEqual(request.path, "/v1/budgets")
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
