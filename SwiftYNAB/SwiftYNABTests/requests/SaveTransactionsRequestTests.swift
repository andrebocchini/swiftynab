//
//  SaveTransactionsRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/9/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

import XCTest
@testable import SwiftYNAB

class SaveTransactionsRequestTests: XCTestCase {
    func testSaveTransactions() throws {
        let transaction = SaveTransaction(
            date: "2019-04-30",
            amount: -25000,
            accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
            payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
            payeeName: "University of Illinois at Chicago"
        )
        let request = SaveTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactions: [transaction]
        )
        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)
    }

    func testUpdateTransactions() throws {
        let transaction = SaveTransaction(
            date: "2019-04-30",
            amount: -25000,
            accountId: "f9574c30-0614-7880-e926-0ae2c2f6d990",
            payeeId: "3c296a94-aed1-7a26-93cb-0ae2c2f82363",
            payeeName: "University of Illinois at Chicago"
        )
        let request = SaveTransactionsRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            transactions: [transaction],
            update: true
        )
        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/transactions"
        )
        XCTAssertEqual(request.method, .patch)
        XCTAssertNil(request.query)
    }
}
