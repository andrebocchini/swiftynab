//
//  ScheduledTransactionRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class ScheduledTransactionRequestTests: XCTestCase {

    func testScheduledTransactionRequest() {
        let request = ScheduledTransactionRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                                  transactionId: "6aa65ae8-919d-481b-8bd0-6d125dc97016")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions/6aa65ae8-919d-481b-8bd0-6d125dc97016")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testScheduledTransactionsRequest() {
        let request = ScheduledTransactionsRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/scheduled_transactions")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
}
