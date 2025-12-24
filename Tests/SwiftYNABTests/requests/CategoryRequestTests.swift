//
//  CategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CategoryRequestTests: XCTestCase {
    func testCategoryRequest() {
        let request = CategoryRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryId: "9b6ff04f-b123-d126-4605-0ae2c2f5e3ba"
        )
        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/9b6ff04f-b123-d126-4605-0ae2c2f5e3ba"
        )
        XCTAssertEqual(request.method, .get)
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
}
