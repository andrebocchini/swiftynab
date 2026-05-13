//
//  NewCategory.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// A model representing a new category to be created.
/// Both `name` and `categoryGroupId` are required by the API.
public struct NewCategory: Codable, Equatable, Sendable {
    /// The name of the category
    public let name: String

    /// The ID of the category group this category belongs to
    public let categoryGroupId: String

    /// Optional note for the category
    public let note: String?

    /// The goal target amount in milliunits format. If value is specified and goal has not already
    /// been configured for category, a monthly goal will be created for the category with this
    /// target amount. If goalType is not specified, it will default to "NEED" or "MF" for credit
    /// card payment categories.
    public let goalTarget: Int64?

    /// The goal target date in ISO format (e.g. 2016-12-01)
    public let goalTargetDate: String?

    /// Whether the goal requires the full target amount each period.
    public let goalNeedsWholeAmount: Bool?

    /// Creates a new NewCategory instance
    /// - Parameters:
    ///   - name: The name of the category
    ///   - categoryGroupId: The ID of the category group this category belongs to
    ///   - note: Optional note for the category
    ///   - goalTarget: The goal target amount in milliunits format
    ///   - goalTargetDate: The goal target date in ISO format (e.g. 2016-12-01)
    ///   - goalNeedsWholeAmount: Whether the goal requires the full target amount each period
    public init(
        name: String,
        categoryGroupId: String,
        note: String? = nil,
        goalTarget: Int64? = nil,
        goalTargetDate: String? = nil,
        goalNeedsWholeAmount: Bool? = nil
    ) {
        self.name = name
        self.categoryGroupId = categoryGroupId
        self.note = note
        self.goalTarget = goalTarget
        self.goalTargetDate = goalTargetDate
        self.goalNeedsWholeAmount = goalNeedsWholeAmount
    }
}
