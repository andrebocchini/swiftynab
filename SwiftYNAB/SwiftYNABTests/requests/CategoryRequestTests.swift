//
//  CategoryRequestTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import XCTest

@testable import SwiftYNAB

class CategoriesRequestTests: XCTestCase {
    
    func testCategoriesRequestWithKnowledge() {
        let request = CategoriesRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                        lastKnowledgeOfServer: 100)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.query?.count, 1)
        XCTAssertEqual(request.query?[0], URLQueryItem(name: "last_knowledge_of_server", value: "100"))
        XCTAssertNil(request.body)
    }
    
    func testCategoriesRequest() {
        let request = CategoriesRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testCategoryRequest() {
        let request = CategoryRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                      categoryId: "9b6ff04f-b123-d126-4605-0ae2c2f5e3ba")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/categories/9b6ff04f-b123-d126-4605-0ae2c2f5e3ba")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testCategoryByMonthRequest() {
        let request = CategoryByMonthRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                             month: "2019-08-01",
                                             categoryId: "e7d71940-5f38-5646-e885-0ae2c2f6af57")
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2019-08-01/categories/e7d71940-5f38-5646-e885-0ae2c2f6af57")
        XCTAssertEqual(request.method, "GET")
        XCTAssertNil(request.query)
        XCTAssertNil(request.body)
    }
    
    func testSaveMonthCategoryRequestWrapper() {
        let saveMonthCategory = SaveMonthCategory(budgeted: 1000)
        let wrapper = SaveMonthCategoryRequestWrapper(with: saveMonthCategory)
        XCTAssertNoThrow(try TestingTools.testEncoding(wrapper))
    }
    
    func testSaveMonthCategoryRequest() {
        let expectedRequestBody = try! TestingTools.loadJSON(for: SaveMonthCategoryRequestWrapper.self)
        let request = SaveMonthCategoryRequest(budgetId: "43dcbde6-ccf4-4367-9d13-d6d7e9beeb99",
                                               month: "2019-08-01",
                                               categoryId: "e7d71940-5f38-5646-e885-0ae2c2f6af57",
                                               budgeted: 1000)
        XCTAssertEqual(request.path, "/v1/budgets/43dcbde6-ccf4-4367-9d13-d6d7e9beeb99/months/2019-08-01/categories/e7d71940-5f38-5646-e885-0ae2c2f6af57")
        XCTAssertEqual(request.method, "PATCH")
        XCTAssertNil(request.query)
        XCTAssertEqual(request.body, expectedRequestBody)
    }
    
}
