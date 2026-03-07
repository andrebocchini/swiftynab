//
//  UpdateCategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 6/20/25.
//  Copyright © 2025 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Update Category Request") struct UpdateCategoryRequestTests {
    @Test("Request uses PATCH method with category data in body") func updateCategoryRequest() {
        let category = SaveCategory(name: "Updated Category Name")

        let request = UpdateCategoryRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryId: "c36fbd68-131e-4ea8-b30f-94f43423021c",
            category: category
        )

        // swiftlint:disable:next line_length

        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/c36fbd68-131e-4ea8-b30f-94f43423021c")
        #expect(request.method == .patch)
        #expect(request.query == nil)
        #expect(request.body != nil)
    }
}
