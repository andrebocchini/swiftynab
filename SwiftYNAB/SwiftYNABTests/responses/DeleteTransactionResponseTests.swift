//
//  DeleteTransactionResponseTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 4/12/23.
//  Copyright © 2023 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class DeleteTransactionResponseTests: XCTestCase {
    func testDeleteTransactionResponseDecoding() {
        XCTAssertNoThrow(try JSONTools.testDecoding(type: DeleteTransactionResponse.self))
    }
}
