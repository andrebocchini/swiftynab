//
//  SaveCategory.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/10/24.
//  Copyright © 2024 Andre Bocchini. All rights reserved.
//

import Foundation

/// A model representing a category to be saved or updated
public struct SaveCategory: Codable, Equatable, Sendable {
    /// The name of the category
    public let name: String?

    /// Optional note for the category
    public let note: String?

    /// The ID of the category group this category belongs to
    public let categoryGroupId: String?

    /// The goal target amount in milliunits format. This amount can only be changed if the category
    /// already has a configured goal
    public let goalTarget: Int64?

    /// Creates a new SaveCategory instance
    /// - Parameters:
    ///   - name: The name of the category
    ///   - note: Optional note for the category
    ///   - categoryGroupId: The ID of the category group this category belongs to
    ///   - goalTarget: The goal target amount in milliunits format (only for categories with
    /// existing goals)
    public init(
        name: String? = nil,
        note: String? = nil,
        categoryGroupId: String? = nil,
        goalTarget: Int64? = nil
    ) {
        self.name = name
        self.note = note
        self.categoryGroupId = categoryGroupId
        self.goalTarget = goalTarget
    }
}
