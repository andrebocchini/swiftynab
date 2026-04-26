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
    /// already has a configured goal. If value is specified and goal has not already been
    /// configured for category, a monthly goal will be created for the category with this target
    /// amount. If goalType is not specified, it will default to "NEED" or "MF" for credit card
    /// payment categories.
    public let goalTarget: Int64?

    /// The goal target date in ISO format (e.g. 2016-12-01)
    public let goalTargetDate: String?

    /// Whether the goal requires the full target amount each period.
    public let goalNeedsWholeAmount: Bool?

    /// Creates a new SaveCategory instance
    /// - Parameters:
    ///   - name: The name of the category
    ///   - note: Optional note for the category
    ///   - categoryGroupId: The ID of the category group this category belongs to
    ///   - goalTarget: The goal target amount in milliunits format (only for categories with
    /// existing goals)
    ///   - goalTargetDate: The goal target date in ISO format (e.g. 2016-12-01)
    ///   - goalNeedsWholeAmount: Whether the goal requires the full target amount each period
    public init(
        name: String? = nil,
        note: String? = nil,
        categoryGroupId: String? = nil,
        goalTarget: Int64? = nil,
        goalTargetDate: String? = nil,
        goalNeedsWholeAmount: Bool? = nil
    ) {
        self.name = name
        self.note = note
        self.categoryGroupId = categoryGroupId
        self.goalTarget = goalTarget
        self.goalTargetDate = goalTargetDate
        self.goalNeedsWholeAmount = goalNeedsWholeAmount
    }
}
