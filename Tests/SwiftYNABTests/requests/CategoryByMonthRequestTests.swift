//
//  CategoryByMonthRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 7/8/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Category By Month Request") struct CategoryByMonthRequestTests {
    @Test("Path includes budget ID, month, and category ID") func categoryByMonthRequest() {
        let request = CategoryByMonthRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            month: "2019-08-01",
            categoryId: "e7d71940-5f38-5646-e885-0ae2c2f6af57"
        )
        // swiftlint:disable:next line_length
        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2019-08-01/categories/e7d71940-5f38-5646-e885-0ae2c2f6af57")
        #expect(request.method == .get)
        #expect(request.query == nil)
        #expect(request.body == nil)
    }
}
