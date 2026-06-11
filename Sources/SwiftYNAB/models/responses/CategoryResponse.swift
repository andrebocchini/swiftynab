//
//  CategoryResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when creating or updating a category
public struct CategoryResponse: Equatable, Sendable {
    /// The created or updated category
    public let category: Category

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(category: Category, serverKnowledge: ServerKnowledge) {
        self.category = category
        self.serverKnowledge = serverKnowledge
    }
}
