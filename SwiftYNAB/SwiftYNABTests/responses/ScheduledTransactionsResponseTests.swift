//
//  ScheduledTransactionsResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class ScheduledTransactionResponseTests: XCTestCase {
 
    func testScheduledTransactionResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(ScheduledTransactionResponse.self))
    }
    
    func testScheduledTransactionsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(ScheduledTransactionsResponse.self))
    }
    
}
    
