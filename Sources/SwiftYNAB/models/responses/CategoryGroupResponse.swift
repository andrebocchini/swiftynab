//
//  CategoryGroupResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when creating or updating a category group
public struct CategoryGroupResponse: Equatable, Sendable {
    /// The created or updated category group
    public let categoryGroup: CategoryGroup

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(categoryGroup: CategoryGroup, serverKnowledge: ServerKnowledge) {
        self.categoryGroup = categoryGroup
        self.serverKnowledge = serverKnowledge
    }
}
