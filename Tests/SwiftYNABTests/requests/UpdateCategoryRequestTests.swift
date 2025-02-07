//
//  UpdateCategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class UpdateCategoryRequestTests: XCTestCase {
    func testUpdateCategoryRequest() {
        let category = SaveCategory(name: "Updated Category Name")

        let request = UpdateCategoryRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryId: "c36fbd68-131e-4ea8-b30f-94f43423021c",
            category: category
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        XCTAssertEqual(request.method, .patch)
        XCTAssertNil(request.query)
        XCTAssertNotNil(request.body)
    }
}
