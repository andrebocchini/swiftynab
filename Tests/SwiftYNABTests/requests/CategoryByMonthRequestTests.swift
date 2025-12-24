//
//  CategoryByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CategoryByMonthRequestTests: XCTestCase {
    func testCategoryByMonthRequest() {
        let request = CategoryByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: "2019-08-01",
            categoryId: "e7d71940-5f38-5646-e885-0ae2c2f6af57"
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2019-08-01/categories/e7d71940-5f38-5646-e885-0ae2c2f6af57"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
