//
//  CategoryService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to category operations
public class CategoryService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension CategoryService: CategoryServiceType {
    /// Returns a list of budget categories.
    ///
    /// Returns all categories grouped by category group. Amounts (budgeted, activity, balance, etc.)
    /// are specific to the current budget month (UTC).
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of category groups
    public func getCategories(
        budgetId: String,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> [CategoryGroupWithCategories] {
        let request = CategoriesRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response: CategoriesResponse = try await client.request(request)
        return response.categoryGroups
    }

    /// Returns a single category.
    ///
    /// Amounts (budgeted, activity, balance, etc.) are specific to the current budget month (UTC).
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - categoryId: The id of the category
    ///
    /// - Returns: A single category
    public func getCategory(budgetId: String, categoryId: String) async throws -> Category {
        let request = CategoryRequest(budgetId: budgetId, categoryId: categoryId)
        let response: CategoryResponse = try await client.request(request)
        return response.category
    }

    /// Returns a single category for a specific budget month.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - month: The budget month in ISO format (e.g. 2016-12-01) (“current” can also be used to
    ///    specify the current calendar month (UTC))
    ///    - categoryId: The id of the category
    ///
    /// - Returns: A single category
    public func getCategory(
        budgetId: String,
        month: String,
        categoryId: String
    ) async throws -> Category {
        let request = CategoryByMonthRequest(
            budgetId: budgetId,
            month: month,
            categoryId: categoryId
        )
        let response: CategoryResponse = try await client.request(request)
        return response.category
    }

    /// Update a category for a specific month.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used budget)
    ///    - month: The budget month in ISO format (e.g. 2016-12-01) (“current” can also be used to
    ///    specify the current calendar month (UTC))
    ///    - categoryId: The id of the category
    ///    - budgeted: Budgeted amount for the category
    ///
    /// - Returns: A single category
    public func updateCategory(
        budgetId: String,
        month: String,
        categoryId: String,
        budgeted: Int
    ) async throws -> Category {
        let request = SaveMonthCategoryRequest(
            budgetId: budgetId,
            month: month,
            categoryId: categoryId,
            budgeted: budgeted
        )
        let response: CategoryResponse = try await client.request(request)
        return response.category
    }
}
