//
//  SaveMonthCategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Save Month Category Request") struct SaveMonthCategoryRequestTests {
    @Test("Request uses PATCH method with budgeted amount in body") func saveMonthCategoryRequest() throws {
        let request = SaveMonthCategoryRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: "2019-08-01",
            categoryId: "e7d71940-5f38-5646-e885-0ae2c2f6af57",
            budgeted: 1000
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2019-08-01/categories/e7d71940-5f38-5646-e885-0ae2c2f6af57")
        #expect(request.method == .patch)
        #expect(request.query == nil)
        #expect(request.body != nil)
    }
}
