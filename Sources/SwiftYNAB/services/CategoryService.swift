//
//  CategoryService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to category operations
public struct CategoryService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension CategoryService: CategoryServiceType {
    /// Returns a list of plan categories.
    ///
    /// Returns all categories grouped by category group. Amounts (budgeted, activity, balance,
    /// etc.)
    /// are specific to the current plan month (UTC).
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of category groups
    public func categories(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> ([CategoryGroupWithCategories], ServerKnowledge) {
        let request = CategoriesRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.categoryGroups, response.serverKnowledge)
    }

    /// Returns a single category.
    ///
    /// Amounts (budgeted, activity, balance, etc.) are specific to the current plan month (UTC).
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryId: The id of the category
    ///
    /// - Returns: A single category
    public func category(planId: String, categoryId: String) async throws -> Category {
        let request = CategoryRequest(planId: planId, categoryId: categoryId)
        let response = try await client.perform(request)
        return response.category
    }

    /// Returns a single category for a specific plan month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) (“current” can also be used to
    /// specify the current
    ///    calendar month (UTC))
    ///    - categoryId: The id of the category
    ///
    /// - Returns: A single category
    public func category(
        planId: String,
        month: String,
        categoryId: String
    ) async throws -> Category {
        let request = CategoryByMonthRequest(
            planId: planId,
            month: month,
            categoryId: categoryId
        )
        let response = try await client.perform(request)
        return response.category
    }

    /// Update a category
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryId: The id of the category
    ///    - category: The category details to be saved
    ///
    /// - Returns: A single category
    public func updateCategory(
        planId: String,
        categoryId: String,
        category: SaveCategory
    ) async throws -> (Category, ServerKnowledge) {
        let request = UpdateCategoryRequest(
            planId: planId,
            categoryId: categoryId,
            category: category
        )
        let response = try await client.perform(request)
        return (response.category, response.serverKnowledge)
    }

    /// Update a category for a specific month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) (“current” can also be used to
    /// specify the current
    ///    calendar month (UTC))
    ///    - categoryId: The id of the category
    ///    - budgeted: Budgeted amount for the category
    ///
    /// - Returns: A single category
    public func updateCategory(
        planId: String,
        month: String,
        categoryId: String,
        budgeted: Int
    ) async throws -> Category {
        let request = SaveMonthCategoryRequest(
            planId: planId,
            month: month,
            categoryId: categoryId,
            budgeted: budgeted
        )
        let response = try await client.perform(request)
        return response.category
    }

    /// Create a new category
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - category: The category to create
    ///
    /// - Returns: The created category and the server knowledge
    public func createCategory(
        planId: String,
        category: NewCategory
    ) async throws -> (Category, ServerKnowledge) {
        let request = CreateCategoryRequest(
            planId: planId,
            category: category
        )
        let response = try await client.perform(request)
        return (response.category, response.serverKnowledge)
    }

    /// Create a new category group
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryGroup: The category group to create
    ///
    /// - Returns: The created category group and the server knowledge
    public func createCategoryGroup(
        planId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> (CategoryGroup, ServerKnowledge) {
        let request = CreateCategoryGroupRequest(
            planId: planId,
            categoryGroup: categoryGroup
        )
        let response = try await client.perform(request)
        return (response.categoryGroup, response.serverKnowledge)
    }

    /// Update a category group
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryGroupId: The id of the category group
    ///    - categoryGroup: The category group details to be saved
    ///
    /// - Returns: The updated category group and the server knowledge
    public func updateCategoryGroup(
        planId: String,
        categoryGroupId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> (CategoryGroup, ServerKnowledge) {
        let request = UpdateCategoryGroupRequest(
            planId: planId,
            categoryGroupId: categoryGroupId,
            categoryGroup: categoryGroup
        )
        let response = try await client.perform(request)
        return (response.categoryGroup, response.serverKnowledge)
    }
}
