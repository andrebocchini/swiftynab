//
//  MoneyMovementGroupsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class MoneyMovementGroupsRequestTests: XCTestCase {
    func testMoneyMovementGroupsRequest() {
        let request = MoneyMovementGroupsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99"
        )
        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/money_movement_groups"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
