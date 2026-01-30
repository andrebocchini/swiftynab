//
//  NewBudgetAccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class NewBudgetAccountRequestTests: XCTestCase {
    func testNewBudgetAccountRequest() throws {
        let request = NewBudgetAccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            name: "name",
            type: .checking,
            balance: 0
        )

        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts")
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)

        let expectedBody = NewBudgetAccountRequest.PostAccountWrapper(
            name: "name",
            type: .checking,
            balance: 0
        )
        let serializer = Serializer()
        let body = try XCTUnwrap(request.body)
        let decodedBody = try serializer.decode(NewBudgetAccountRequest.PostAccountWrapper.self, from: body)
        XCTAssertEqual(decodedBody, expectedBody)
    }
}
