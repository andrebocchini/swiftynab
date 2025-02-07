//
//  TransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class TransactionRequestTests: XCTestCase {
    func testTransactionRequest() {
        let request = TransactionRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactionId: "c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions/c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
