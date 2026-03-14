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
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([CategoryGroupWithCategories], ServerKnowledge)

    func category(planId: String, categoryId: String) async throws -> Category

    func category(planId: String, month: String, categoryId: String) async throws -> Category

    func updateCategory(
        planId: String,
        categoryId: String,
        category: SaveCategory
    ) async throws -> (Category, ServerKnowledge)

    func updateCategory(
        planId: String,
        month: String,
        categoryId: String,
        budgeted: Int
    ) async throws -> Category

    func createCategory(
        planId: String,
        category: SaveCategory
    ) async throws -> (Category, ServerKnowledge)

    func createCategoryGroup(
        planId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> (CategoryGroup, ServerKnowledge)

    func updateCategoryGroup(
        planId: String,
        categoryGroupId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> (CategoryGroup, ServerKnowledge)
}
