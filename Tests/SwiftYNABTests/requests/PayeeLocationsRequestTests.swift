//
//  PayeeLocationsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class PayeeLocationsRequestTests: XCTestCase {
    func testPayeeLocationsRequest() {
        let request = PayeeLocationsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payee_locations"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
