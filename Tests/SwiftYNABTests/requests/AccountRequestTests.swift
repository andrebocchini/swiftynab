//
//  AccountRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class AccountRequestTests: XCTestCase {
    func testAccount() {
        let request = AccountRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990"
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/accounts/f9574c30-0614-7880-e926-0ae2c2f6d990"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
