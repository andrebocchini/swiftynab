//
//  DeleteScheduledTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class DeleteScheduledTransactionRequestTests: XCTestCase {
    func testDeleteScheduledTransactionRequest() {
        let request = DeleteScheduledTransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            scheduledTransactionId: "c36fbd68-131e-4ea8-b30f-94f43423021c"
        )

        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions/c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        XCTAssertEqual(request.method, .delete)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
