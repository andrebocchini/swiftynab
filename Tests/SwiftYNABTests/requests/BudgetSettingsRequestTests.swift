//
//  BudgetSettingsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Budgets Settings Request") struct BudgetsSettingsRequestTests {
    @Test("Path includes budget ID for settings endpoint") func budgetSettingsRequest() {
        let request = BudgetSettingsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/settings")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
