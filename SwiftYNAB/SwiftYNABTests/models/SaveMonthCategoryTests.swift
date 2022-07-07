//
//  SaveMonthCategoryTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class SaveMonthCategoryTests: XCTestCase {
    func testSaveMonthCategoryEncoding() {
        let saveMonthCategory = SaveMonthCategory(budgeted: 0)
        XCTAssertNoThrow(try JSONTools.testEncoding(saveMonthCategory))
    }
}
