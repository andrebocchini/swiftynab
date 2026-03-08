//
//  CreateCategoryGroupRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Create Category Group Request")
struct CreateCategoryGroupRequestTests {
    @Test("Request uses POST method with category group data in body")
    func createCategoryGroupRequest() throws {
        let categoryGroup = SaveCategoryGroup(name: "New Group")

        let request = CreateCategoryGroupRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryGroup: categoryGroup
        )

        #expect(request.path == "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/category_groups")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let expectedBody = PostCategoryGroupWrapper(categoryGroup: categoryGroup)
        let serializer = Serializer()
        let body = try #require(request.body)
        let decodedBody = try serializer.decode(PostCategoryGroupWrapper.self, from: body)
        #expect(decodedBody == expectedBody)
    }
}
