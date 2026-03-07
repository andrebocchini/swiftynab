//
//  CreateCategoryGroupRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class CreateCategoryGroupRequestTests: XCTestCase {
    func testCreateCategoryGroupRequest() throws {
        let categoryGroup = SaveCategoryGroup(name: "New Group")

        let request = CreateCategoryGroupRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryGroup: categoryGroup
        )

        XCTAssertEqual(
            request.path,
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/category_groups"
        )
        XCTAssertEqual(request.method, .post)
        XCTAssertNil(request.query)

        let expectedBody = PostCategoryGroupWrapper(categoryGroup: categoryGroup)
        let serializer = Serializer()
        let body = try XCTUnwrap(request.body)
        let decodedBody = try serializer.decode(PostCategoryGroupWrapper.self, from: body)
        XCTAssertEqual(decodedBody, expectedBody)
    }
}
