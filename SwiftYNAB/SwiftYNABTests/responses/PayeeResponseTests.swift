//
//  PayeeTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class PayeeResponseTests: XCTestCase {
    
    func testPayeesResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(PayeesResponse.self))
    }
    
    func testPayeeResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(PayeeResponse.self))
    }
    
}
