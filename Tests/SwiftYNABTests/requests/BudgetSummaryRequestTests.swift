//
//  BudgetSummaryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Budgets Summary Request")
struct BudgetsSummaryRequestTests {
    @Test("Request includes include_accounts query parameter")
    func budgetSummaryRequest() {
        let request = BudgetSummaryRequest(includeAccounts: false)
        #expect(request.path == "/v1/budgets")
        #expect(request.method == .get)
        #expect(request.query == [URLQueryItem(name: "include_accounts", value: "false")])
        #expect(request.body == nil)
    }
}
