//
//  BudgetSettingsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class BudgetsSettingsRequestTests: XCTestCase {
    func testBudgetSettingsRequest() {
        let request = BudgetSettingsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/settings")
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
