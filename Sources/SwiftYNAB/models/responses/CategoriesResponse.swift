//
//  CategoriesResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the categories in a plan
public struct CategoriesResponse: Equatable, Sendable {
    /// The requested categories, grouped by category group
    public let categoryGroups: [CategoryGroupWithCategories]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(categoryGroups: [CategoryGroupWithCategories], serverKnowledge: ServerKnowledge) {
        self.categoryGroups = categoryGroups
        self.serverKnowledge = serverKnowledge
    }
}
