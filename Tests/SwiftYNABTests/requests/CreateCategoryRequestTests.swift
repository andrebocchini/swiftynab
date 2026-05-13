//
//  CreateCategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Testing
@testable import SwiftYNAB

@Suite("Create Category Request")
struct CreateCategoryRequestTests {
    @Test("Request uses POST method with category data in body")
    func createCategoryRequest() throws {
        let category = NewCategory(
            name: "New Category",
            categoryGroupId: "c36fbd68-131e-4ea8-b30f-94f43423021c",
            goalNeedsWholeAmount: true
        )

        let request = CreateCategoryRequest(
            planId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            category: category
        )

        #expect(request.path == "/v1/plans/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories")
        #expect(request.method == .post)
        #expect(request.query == nil)

        let expectedBody = NewCategoryWrapper(with: category)
        let serializer = Serializer()
        let body = try #require(request.body)
        let decodedBody = try serializer.decode(NewCategoryWrapper.self, from: body)
        #expect(decodedBody == expectedBody)
    }
}
