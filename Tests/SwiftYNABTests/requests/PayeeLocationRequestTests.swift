//
//  PayeeLocationRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class PayeeLocationRequestTests: XCTestCase {
    func testPayeeLocationRequest() {
        let request = PayeeLocationRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            payeeId: "0bfe752a-89e1-65d4-73d4-0ae2c2f71d54"
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/payee_locations/0bfe752a-89e1-65d4-73d4-0ae2c2f71d54"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
