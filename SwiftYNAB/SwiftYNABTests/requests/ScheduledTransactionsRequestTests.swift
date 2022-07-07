//
//  ScheduledTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class ScheduledTransactionsRequestTests: XCTestCase {
    func testScheduledTransactionsRequest() {
        let request = ScheduledTransactionsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
