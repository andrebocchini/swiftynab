//
//  CategoryServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol CategoryServiceType: Sendable {
    func categories(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([CategoryGroupWithCategories], ServerKnowledge)

    func category(budgetId: String, categoryId: String) async throws -> Category

    func category(budgetId: String, month: String, categoryId: String) async throws -> Category

    func updateCategory(
        budgetId: String,
        categoryId: String,
        category: SaveCategory
    ) async throws -> (Category, ServerKnowledge)

    func updateCategory(
        budgetId: String,
        month: String,
        categoryId: String,
        budgeted: Int
    ) async throws -> Category

    func createCategory(
        budgetId: String,
        category: SaveCategory
    ) async throws -> (Category, ServerKnowledge)

    func createCategoryGroup(
        budgetId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> (CategoryGroup, ServerKnowledge)

    func updateCategoryGroup(
        budgetId: String,
        categoryGroupId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> (CategoryGroup, ServerKnowledge)
}
