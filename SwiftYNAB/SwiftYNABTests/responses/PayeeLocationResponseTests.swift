//
//  PayeeLocationResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class PayeeLocationResponseTests: XCTestCase {
    
    func testPayeeLocationsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(PayeeLocationsResponse.self))
    }
    
    func testPayeeLocationResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(PayeeLocationResponse.self))
    }
    
}
