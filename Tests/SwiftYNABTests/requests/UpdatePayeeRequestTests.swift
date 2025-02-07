//
//  UpdatePayeeRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class UpdatePayeeRequestTests: XCTestCase {
    func testUpdatePayeeRequest() {
        let payee = SavePayee(name: "Updated Payee Name")

        let request = UpdatePayeeRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            payeeId: "c36fbd68-131e-4ea8-b30f-94f43423021c",
            payee: payee
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payees/c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        XCTAssertEqual(request.method, .patch)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)
    }
}
