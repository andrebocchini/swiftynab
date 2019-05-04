//
//  TransactionResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class TransactionResponseTests: XCTestCase {

    func testSaveTransactionResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(SaveTransactionResponse.self))
    }
    
    func testTransactionResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(TransactionResponse.self))
    }
    
    func testTransactionsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(TransactionsResponse.self))
    }

    func testSaveTransactionsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(SaveTransactionsResponse.self))
    }
    
    func testHybridTransactionsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(HybridTransactionsResponse.self))
    }

}
