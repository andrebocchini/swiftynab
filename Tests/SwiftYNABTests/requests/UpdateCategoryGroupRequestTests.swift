//
//  UpdateCategoryGroupRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import XCTest
@testable import SwiftYNAB

class UpdateCategoryGroupRequestTests: XCTestCase {
    func testUpdateCategoryGroupRequest() throws {
        let categoryGroup = SaveCategoryGroup(name: "Updated Group Name")

        let request = UpdateCategoryGroupRequest(
            budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
            categoryGroupId: "c36fbd68-131e-4ea8-b30f-94f43423021c",
            categoryGroup: categoryGroup
        )

        XCTAssertEqual(
            request.path,
            // swiftlint:disable:next line_length
            "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/category_groups/c36fbd68-131e-4ea8-b30f-94f43423021c"
        )
        XCTAssertEqual(request.method, .patch)
        XCTAssertNil(request.query)

        let expectedBody = PatchCategoryGroupWrapper(categoryGroup: categoryGroup)
        let serializer = Serializer()
        let body = try XCTUnwrap(request.body)
        let decodedBody = try serializer.decode(PatchCategoryGroupWrapper.self, from: body)
        XCTAssertEqual(decodedBody, expectedBody)
    }
}
