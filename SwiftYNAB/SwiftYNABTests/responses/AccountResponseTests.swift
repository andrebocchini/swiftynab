//
//  AccountResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class AccountResponseTests: XCTestCase {
    
    func testAccountsResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(AccountsResponse.self))
    }
    
    func testAccountResponseDecoding() {
        XCTAssertNoThrow(try TestingTools.testDecoding(AccountResponse.self))
    }
    
}
