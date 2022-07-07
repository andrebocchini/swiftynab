//
//  HybridTransactionsResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class HybridTransactionsResponseTests: XCTestCase {
    func testHybridTransactionsResponseDecoding() {
        XCTAssertNoThrow(try JSONTools.testDecoding(type: HybridTransactionsResponse.self))
    }
}
