//
//  CategoryServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftYNAB

class CategoryServiceTests: XCTestCase {
    func testGetCategoriesReturnsCategoriesWhenRequestSucceeds() async throws {
        let expectedCategoryGroup = CategoryGroupWithCategories(
            id: "id",
            name: "name",
            hidden: false,
            deleted: false,
            categories: []
        )
        let expectedResponse = CategoriesRequest.Response(
            categoryGroups: [expectedCategoryGroup],
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.getCategories(budgetId: "budget_id")

        XCTAssertEqual(actualResponse.0.count, 1)
        XCTAssertEqual(expectedCategoryGroup, actualResponse.0[0])
        XCTAssertEqual(200, actualResponse.1)
    }

    func testGetCategoriesThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        do {
            _ = try await service.getCategories(budgetId: "budget_id", lastKnowledgeOfServer: nil)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetCategoryReturnsCategoryWhenRequestSucceeds() async throws {
        let expectedCategory = Category(
            id: "id",
            categoryGroupId: "group_id",
            categoryGroupName: "category",
            name: "name",
            hidden: false,
            originalCategoryGroupId: nil,
            note: nil,
            budgeted: 0,
            activity: 0,
            balance: 0,
            goalType: nil,
            goalNeedsWholeAmount: nil,
            goalDay: nil,
            goalCadence: nil,
            goalCadenceFrequency: nil,
            goalCreationMonth: nil,
            goalTarget: nil,
            goalTargetMonth: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            deleted: false
        )
        let expectedResponse = CategoryRequest.Response(category: expectedCategory)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.getCategory(budgetId: "budget_id", categoryId: "id")

        XCTAssertEqual(expectedCategory, actualResponse)
    }

    func testGetCategoryThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        do {
            _ = try await service.getCategory(budgetId: "budget_id", categoryId: "month_id")
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testGetCategoryWithMonthReturnsCategoryWhenRequestSucceeds() async throws {
        let expectedCategory = Category(
            id: "id",
            categoryGroupId: "group_id",
            categoryGroupName: "category",
            name: "name",
            hidden: false,
            originalCategoryGroupId: nil,
            note: nil,
            budgeted: 0,
            activity: 0,
            balance: 0,
            goalType: nil,
            goalNeedsWholeAmount: nil,
            goalDay: nil,
            goalCadence: nil,
            goalCadenceFrequency: nil,
            goalCreationMonth: nil,
            goalTarget: nil,
            goalTargetMonth: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            deleted: false
        )
        let expectedResponse = CategoryByMonthRequest.Response(category: expectedCategory)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.getCategory(
            budgetId: "budget_id",
            month: "april",
            categoryId: "id"
        )

        XCTAssertEqual(expectedCategory, actualResponse)
    }

    func testGetCategoryWithMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        do {
            _ = try await service.getCategory(
                budgetId: "budget_id",
                month: "april",
                categoryId: "id"
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testUpdateCategoryReturnsCategoryWhenRequestSucceeds() async throws {
        let expectedCategory = Category(
            id: "id",
            categoryGroupId: "group_id",
            categoryGroupName: "category",
            name: "name",
            hidden: false,
            originalCategoryGroupId: nil,
            note: nil,
            budgeted: 0,
            activity: 0,
            balance: 0,
            goalType: nil,
            goalNeedsWholeAmount: nil,
            goalDay: nil,
            goalCadence: nil,
            goalCadenceFrequency: nil,
            goalCreationMonth: nil,
            goalTarget: nil,
            goalTargetMonth: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            deleted: false
        )
        let expectedResponse = UpdateCategoryRequest.Response(
            category: expectedCategory,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.updateCategory(
            budgetId: "budget_id",
            categoryId: "id",
            category: SaveCategory()
        )

        XCTAssertEqual(expectedCategory, actualResponse.0)
        XCTAssertEqual(200, actualResponse.1)
    }

    func testUpdateCategoryThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        do {
            _ = try await service.updateCategory(
                budgetId: "budget_id",
                categoryId: "id",
                category: SaveCategory()
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }

    func testUpdateCategoryByMonthReturnsCategoryWhenRequestSucceeds() async throws {
        let expectedCategory = Category(
            id: "id",
            categoryGroupId: "group_id",
            categoryGroupName: "category",
            name: "name",
            hidden: false,
            originalCategoryGroupId: nil,
            note: nil,
            budgeted: 0,
            activity: 0,
            balance: 0,
            goalType: nil,
            goalNeedsWholeAmount: nil,
            goalDay: nil,
            goalCadence: nil,
            goalCadenceFrequency: nil,
            goalCreationMonth: nil,
            goalTarget: nil,
            goalTargetMonth: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            deleted: false
        )
        let expectedResponse = SaveMonthCategoryRequest.Response(category: expectedCategory)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.updateCategory(
            budgetId: "budget_id",
            month: "april",
            categoryId: "id",
            budgeted: 0
        )

        XCTAssertEqual(expectedCategory, actualResponse)
    }

    func testUpdateCategoryByMonthThrowsErrorWhenRequestFails() async throws {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        do {
            _ = try await service.updateCategory(
                budgetId: "budget_id",
                month: "april",
                categoryId: "id",
                budgeted: 0
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as? SwiftYNABError, .httpError(statusCode: 500))
        }
    }
}
