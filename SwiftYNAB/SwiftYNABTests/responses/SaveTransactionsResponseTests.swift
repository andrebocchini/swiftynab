//
//  SaveTransactionsResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class SaveTransactionsResponseTests: XCTestCase {
    func testSaveTransactionsResponseDecoding() {
        XCTAssertNoThrow(try JSONTools.testDecoding(type: SaveTransactionsResponse.self))
    }
}
