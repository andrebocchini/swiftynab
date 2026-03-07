//
//  CreateCategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CreateCategoryRequestTests: XCTestCase {
    func testCreateCategoryRequest() throws {
        let category = SaveCategory(
            name: "New Category",
            categoryGroupId: "c36fbd68-131e-4ea8-b30f-94f43423021c"
        )

        let request = CreateCategoryRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            category: category
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)

        let expectedBody = PostCategoryWrapper(category: category)
        let serializer = Serializer()
        let body = try XCTUnwrap(request.body)
        let decodedBody = try serializer.decode(PostCategoryWrapper.self, from: body)
        XCTAssertEqual(decodedBody, expectedBody)
    }
}
