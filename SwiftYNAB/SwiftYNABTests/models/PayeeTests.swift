//
//  PayeeTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class PayeeTests: XCTestCase {
    func testPayeeDecoding() {
        XCTAssertNoThrow(try JSONTools.testDecoding(type: Payee.self))
    }
}
