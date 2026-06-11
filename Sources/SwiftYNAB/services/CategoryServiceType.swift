//
//  CategoryServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to category operations
public protocol CategoryServiceType: Sendable {
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
    /// - Returns: A list of category groups and the knowledge of the server
    func categories(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> CategoriesResponse

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
    func category(planId: String, categoryId: String) async throws -> Category

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
    func category(planId: String, month: String, categoryId: String) async throws -> Category

    /// Update a category
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryId: The id of the category
    ///    - category: The category details to be saved
    ///
    /// - Returns: The updated category and the knowledge of the server
    func updateCategory(
        planId: String,
        categoryId: String,
        category: SaveCategory
    ) async throws -> CategoryResponse

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
    func updateCategory(
        planId: String,
        month: String,
        categoryId: String,
        budgeted: Int
    ) async throws -> Category

    /// Create a new category
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - category: The category to create
    ///
    /// - Returns: The created category and the knowledge of the server
    func createCategory(
        planId: String,
        category: NewCategory
    ) async throws -> CategoryResponse

    /// Create a new category group
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryGroup: The category group to create
    ///
    /// - Returns: The created category group and the knowledge of the server
    func createCategoryGroup(
        planId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> CategoryGroupResponse

    /// Update a category group
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - categoryGroupId: The id of the category group
    ///    - categoryGroup: The category group details to be saved
    ///
    /// - Returns: The updated category group and the knowledge of the server
    func updateCategoryGroup(
        planId: String,
        categoryGroupId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> CategoryGroupResponse
}

public extension CategoryServiceType {
    /// Returns a list of plan categories, with optional parameters defaulted.
    func categories(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> CategoriesResponse {
        try await categories(planId: planId, lastKnowledgeOfServer: lastKnowledgeOfServer)
    }
}
