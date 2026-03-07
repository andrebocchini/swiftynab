//
//  MoneyMovementGroupsByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Money Movement Groups By Month Request") struct MoneyMovementGroupsByMonthRequestTests {
    @Test("Path includes budget ID and month for money movement groups") func moneyMovementGroupsByMonthRequest() {
        let request = MoneyMovementGroupsByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: "2024-01-01"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2024-01-01/money_movement_groups")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
