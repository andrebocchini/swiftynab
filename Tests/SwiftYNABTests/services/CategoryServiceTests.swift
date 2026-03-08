//
//  CategoryServiceTests.swift
//  SwiftYNABTests
//
//  Created by Andre Bocchini on 8/26/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation
import Testing
@testable import SwiftYNAB

@Suite("Category Service")
// swiftlint:disable:next type_body_length
struct CategoryServiceTests {
    @Test("Returns category groups with categories when request succeeds")
    func categoriesReturnsCategoriesWhenRequestSucceeds() async throws {
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
        let actualResponse = try await service.categories(budgetId: "budget_id")

        #expect(actualResponse.0.count == 1)
        #expect(expectedCategoryGroup == actualResponse.0[0])
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when fetching categories fails")
    func categoriesThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.categories(budgetId: "budget_id", lastKnowledgeOfServer: nil)
        }
    }

    @Test("Returns a single category when request succeeds")
    func categoryReturnsCategoryWhenRequestSucceeds() async throws {
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
            goalTargetDate: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            goalSnoozedAt: nil,
            deleted: false
        )
        let expectedResponse = CategoryRequest.Response(category: expectedCategory)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.category(budgetId: "budget_id", categoryId: "id")

        #expect(expectedCategory == actualResponse)
    }

    @Test("Throws error when fetching a single category fails")
    func categoryThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.category(budgetId: "budget_id", categoryId: "month_id")
        }
    }

    @Test("Returns category for a specific month when request succeeds")
    func categoryWithMonthReturnsCategoryWhenRequestSucceeds() async throws {
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
            goalTargetDate: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            goalSnoozedAt: nil,
            deleted: false
        )
        let expectedResponse = CategoryByMonthRequest.Response(category: expectedCategory)
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.category(
            budgetId: "budget_id",
            month: "april",
            categoryId: "id"
        )

        #expect(expectedCategory == actualResponse)
    }

    @Test("Throws error when fetching category by month fails")
    func categoryWithMonthThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.category(
                budgetId: "budget_id",
                month: "april",
                categoryId: "id"
            )
        }
    }

    @Test("Returns updated category when update request succeeds")
    func updateCategoryReturnsCategoryWhenRequestSucceeds() async throws {
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
            goalTargetDate: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            goalSnoozedAt: nil,
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

        #expect(expectedCategory == actualResponse.0)
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when updating category fails")
    func updateCategoryThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updateCategory(
                budgetId: "budget_id",
                categoryId: "id",
                category: SaveCategory()
            )
        }
    }

    @Test("Returns updated category when updating by month succeeds")
    func updateCategoryByMonthReturnsCategoryWhenRequestSucceeds() async throws {
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
            goalTargetDate: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            goalSnoozedAt: nil,
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

        #expect(expectedCategory == actualResponse)
    }

    @Test("Throws error when updating category by month fails")
    func updateCategoryByMonthThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updateCategory(
                budgetId: "budget_id",
                month: "april",
                categoryId: "id",
                budgeted: 0
            )
        }
    }

    // MARK: - Create Category

    @Test("Returns created category when create request succeeds")
    func createCategoryReturnsCategoryWhenRequestSucceeds() async throws {
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
            goalTargetDate: nil,
            goalPercentageComplete: nil,
            goalMonthsToBudget: nil,
            goalUnderFunded: nil,
            goalOverallFunded: nil,
            goalOverallLeft: nil,
            goalSnoozedAt: nil,
            deleted: false
        )
        let expectedResponse = CreateCategoryRequest.Response(
            category: expectedCategory,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.createCategory(
            budgetId: "budget_id",
            category: SaveCategory(name: "name", categoryGroupId: "group_id")
        )

        #expect(expectedCategory == actualResponse.0)
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when creating category fails")
    func createCategoryThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.createCategory(
                budgetId: "budget_id",
                category: SaveCategory(name: "name", categoryGroupId: "group_id")
            )
        }
    }

    // MARK: - Create Category Group

    @Test("Returns created category group when create request succeeds")
    func createCategoryGroupReturnsCategoryGroupWhenRequestSucceeds() async throws {
        let expectedCategoryGroup = CategoryGroup(
            id: "id",
            name: "name",
            hidden: false,
            deleted: false
        )
        let expectedResponse = CreateCategoryGroupRequest.Response(
            categoryGroup: expectedCategoryGroup,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.createCategoryGroup(
            budgetId: "budget_id",
            categoryGroup: SaveCategoryGroup(name: "name")
        )

        #expect(expectedCategoryGroup == actualResponse.0)
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when creating category group fails")
    func createCategoryGroupThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.createCategoryGroup(
                budgetId: "budget_id",
                categoryGroup: SaveCategoryGroup(name: "name")
            )
        }
    }

    // MARK: - Update Category Group

    @Test("Returns updated category group when update request succeeds")
    func updateCategoryGroupReturnsCategoryGroupWhenRequestSucceeds() async throws {
        let expectedCategoryGroup = CategoryGroup(
            id: "id",
            name: "updated name",
            hidden: false,
            deleted: false
        )
        let expectedResponse = UpdateCategoryGroupRequest.Response(
            categoryGroup: expectedCategoryGroup,
            serverKnowledge: 200
        )
        let client = MockSuccessClient(expectedResponse: expectedResponse)
        let service = CategoryService(client: client)
        let actualResponse = try await service.updateCategoryGroup(
            budgetId: "budget_id",
            categoryGroupId: "id",
            categoryGroup: SaveCategoryGroup(name: "updated name")
        )

        #expect(expectedCategoryGroup == actualResponse.0)
        #expect(actualResponse.1 == 200)
    }

    @Test("Throws error when updating category group fails")
    func updateCategoryGroupThrowsErrorWhenRequestFails() async {
        let expectedError = SwiftYNABError.httpError(statusCode: 500)
        let client = MockFailureClient(expectedError: expectedError)
        let service = CategoryService(client: client)

        await #expect(throws: SwiftYNABError.httpError(statusCode: 500)) {
            try await service.updateCategoryGroup(
                budgetId: "budget_id",
                categoryGroupId: "id",
                categoryGroup: SaveCategoryGroup(name: "updated name")
            )
        }
    }
}
