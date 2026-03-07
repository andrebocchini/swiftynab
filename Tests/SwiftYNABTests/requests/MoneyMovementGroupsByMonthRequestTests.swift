//
//  MoneyMovementGroupsByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class MoneyMovementGroupsByMonthRequestTests: XCTestCase {
    func testMoneyMovementGroupsByMonthRequest() {
        let request = MoneyMovementGroupsByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: "2024-01-01"
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2024-01-01/money_movement_groups"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
