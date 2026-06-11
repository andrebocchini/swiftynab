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
    public func categories(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> CategoriesResponse {
        let request = CategoriesRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return CategoriesResponse(
            categoryGroups: response.categoryGroups,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func category(planId: String, categoryId: String) async throws -> Category {
        let request = CategoryRequest(planId: planId, categoryId: categoryId)
        let response = try await client.perform(request)
        return response.category
    }

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

    public func updateCategory(
        planId: String,
        categoryId: String,
        category: SaveCategory
    ) async throws -> CategoryResponse {
        let request = UpdateCategoryRequest(
            planId: planId,
            categoryId: categoryId,
            category: category
        )
        let response = try await client.perform(request)
        return CategoryResponse(
            category: response.category,
            serverKnowledge: response.serverKnowledge
        )
    }

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

    public func createCategory(
        planId: String,
        category: NewCategory
    ) async throws -> CategoryResponse {
        let request = CreateCategoryRequest(
            planId: planId,
            category: category
        )
        let response = try await client.perform(request)
        return CategoryResponse(
            category: response.category,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func createCategoryGroup(
        planId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> CategoryGroupResponse {
        let request = CreateCategoryGroupRequest(
            planId: planId,
            categoryGroup: categoryGroup
        )
        let response = try await client.perform(request)
        return CategoryGroupResponse(
            categoryGroup: response.categoryGroup,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func updateCategoryGroup(
        planId: String,
        categoryGroupId: String,
        categoryGroup: SaveCategoryGroup
    ) async throws -> CategoryGroupResponse {
        let request = UpdateCategoryGroupRequest(
            planId: planId,
            categoryGroupId: categoryGroupId,
            categoryGroup: categoryGroup
        )
        let response = try await client.perform(request)
        return CategoryGroupResponse(
            categoryGroup: response.categoryGroup,
            serverKnowledge: response.serverKnowledge
        )
    }
}
