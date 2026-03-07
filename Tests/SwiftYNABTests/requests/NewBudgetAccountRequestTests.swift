//
//  NewBudgetAccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("New Budget Account Request") struct NewBudgetAccountRequestTests {
    @Test("Request uses POST method with account details in body") func newBudgetAccountRequest() throws {
        let request = NewBudgetAccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            name: "name",
            type: .checking,
            balance: 0
        )

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let expectedBody = NewBudgetAccountRequest.PostAccountWrapper(
            name: "name",
            type: .checking,
            balance: 0
        )
        let serializer = Serializer()
        let body = try #require(request.body)
        let decodedBody = try serializer.decode(NewBudgetAccountRequest.PostAccountWrapper.self, from: body)
        #expect(decodedBody == expectedBody)
    }
}
