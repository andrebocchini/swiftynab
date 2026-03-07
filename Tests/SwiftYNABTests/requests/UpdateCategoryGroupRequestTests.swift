//
//  UpdateCategoryGroupRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Update Category Group Request") struct UpdateCategoryGroupRequestTests {
    @Test("Request uses PATCH method with category group data in body") func updateCategoryGroupRequest() throws {
        let categoryGroup = SaveCategoryGroup(name: "Updated Group Name")

        let request = UpdateCategoryGroupRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryGroupId: "c36fbd68-131e-4ea8-b30f-94f43423021c",
            categoryGroup: categoryGroup
        )

        // swiftlint:disable:next line_length

        #expect(request.path ==
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/category_groups/c36fbd68-131e-4ea8-b30f-94f43423021c")
        #expect(request.method == .patch)
        #expect(request.query == nil)

        let expectedBody = PatchCategoryGroupWrapper(categoryGroup: categoryGroup)
        let serializer = Serializer()
        let body = try #require(request.body)
        let decodedBody = try serializer.decode(PatchCategoryGroupWrapper.self, from: body)
        #expect(decodedBody == expectedBody)
    }
}
