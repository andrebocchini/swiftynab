//
//  MonthResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

import XCTest

@testable import SwiftYNAB

class MonthResponseTests: XCTestCase {
    
    func testMonthsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(MonthsResponse.self))
    }

    func testMonthResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(MonthResponse.self))
    }
    
}
