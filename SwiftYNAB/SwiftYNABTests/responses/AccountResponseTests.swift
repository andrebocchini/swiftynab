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
    func testAccountResponseDecoding() {
        XCTAssertNoThrow(try JSONTools.testDecoding(type: AccountResponse.self))
    }

    func testNewBudgetAccountResponseDecoding() {
        XCTAssertNoThrow(
            try JSONTools
                .testDecoding(jsonFile: "NewBudgetAccountResponse", type: AccountResponse.self)
        )
    }
}
