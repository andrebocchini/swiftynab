//
//  BudgetResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class BudgetResponseTests: XCTestCase {
    
    func testBudgetSummaryResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(BudgetSummaryResponse.self))
    }
    
    func testBudgetSettingsResponse() {
        XCTAssertNoThrow(try TestingTools.testDecoding(BudgetSettingsResponse.self))
    }
    
    func testBudgetDetailResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(BudgetDetailResponse.self))
    }
    
}
