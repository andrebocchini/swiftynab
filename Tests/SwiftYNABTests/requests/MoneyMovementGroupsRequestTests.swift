//
//  MoneyMovementGroupsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Money Movement Groups Request") struct MoneyMovementGroupsRequestTests {
    @Test("Path includes budget ID for listing money movement groups") func moneyMovementGroupsRequest() {
        let request = MoneyMovementGroupsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99"
        )
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/money_movement_groups")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
