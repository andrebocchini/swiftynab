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

    /// The ID of the category group this category belongs to. An internal category group may not
    /// be specified.
    public let categoryGroupId: String?

    /// The goal target amount in milliunits format. This amount can only be changed if the category
    /// already has a configured goal. If value is specified and goal has not already been
    /// configured for category, a monthly goal will be created for the category with this target
    /// amount. If goalType is not specified, it will default to "NEED" or "MF" for credit card
    /// payment categories.
    public var goalTarget: Int64? {
        if case let .set(amount) = goalTargetUpdate {
            amount
        } else {
            nil
        }
    }

    /// The change to apply to the goal target.
    public let goalTargetUpdate: CategoryGoalTargetUpdate

    /// The goal target date in ISO format (e.g. 2016-12-01)
    public let goalTargetDate: String?

    /// Whether the goal requires the full target amount each period.
    public let goalNeedsWholeAmount: Bool?

    /// The recurrence frequency for the goal target. Requires `goalTarget`, cannot be combined
    /// with `goalTargetDate`, and is not supported for Credit Card Payment categories. Omit this
    /// value to leave an existing target's cadence unchanged.
    public let goalFrequency: CategoryGoalFrequency?

    /// Creates a new SaveCategory instance
    /// - Parameters:
    ///   - name: The name of the category
    ///   - note: Optional note for the category
    ///   - categoryGroupId: The ID of the category group this category belongs to
    ///   - goalTarget: The goal target amount in milliunits format (only for categories with
    /// existing goals)
    ///   - goalTargetDate: The goal target date in ISO format (e.g. 2016-12-01)
    ///   - goalNeedsWholeAmount: Whether the goal requires the full target amount each period
    ///   - goalFrequency: The recurrence frequency for the goal target
    public init(
        name: String? = nil,
        note: String? = nil,
        categoryGroupId: String? = nil,
        goalTarget: Int64? = nil,
        goalTargetDate: String? = nil,
        goalNeedsWholeAmount: Bool? = nil,
        goalFrequency: CategoryGoalFrequency? = nil
    ) {
        self.name = name
        self.note = note
        self.categoryGroupId = categoryGroupId
        goalTargetUpdate = goalTarget.map(CategoryGoalTargetUpdate.set) ?? .unchanged
        self.goalTargetDate = goalTargetDate
        self.goalNeedsWholeAmount = goalNeedsWholeAmount
        self.goalFrequency = goalFrequency
    }

    /// Creates a new SaveCategory instance with an explicit goal target update.
    /// - Parameters:
    ///   - name: The name of the category
    ///   - note: Optional note for the category
    ///   - categoryGroupId: The ID of the category group this category belongs to
    ///   - goalTargetUpdate: The change to apply to the goal target
    ///   - goalTargetDate: The goal target date in ISO format (e.g. 2016-12-01)
    ///   - goalNeedsWholeAmount: Whether the goal requires the full target amount each period
    ///   - goalFrequency: The recurrence frequency for the goal target
    public init(
        name: String? = nil,
        note: String? = nil,
        categoryGroupId: String? = nil,
        goalTargetUpdate: CategoryGoalTargetUpdate,
        goalTargetDate: String? = nil,
        goalNeedsWholeAmount: Bool? = nil,
        goalFrequency: CategoryGoalFrequency? = nil
    ) {
        self.name = name
        self.note = note
        self.categoryGroupId = categoryGroupId
        self.goalTargetUpdate = goalTargetUpdate
        self.goalTargetDate = goalTargetDate
        self.goalNeedsWholeAmount = goalNeedsWholeAmount
        self.goalFrequency = goalFrequency
    }
}

public extension SaveCategory {
    private enum CodingKeys: String, CodingKey {
        case name
        case note
        case categoryGroupId
        case goalTarget
        case goalTargetDate
        case goalNeedsWholeAmount
        case goalFrequency
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        note = try container.decodeIfPresent(String.self, forKey: .note)
        categoryGroupId = try container.decodeIfPresent(String.self, forKey: .categoryGroupId)
        goalTargetDate = try container.decodeIfPresent(String.self, forKey: .goalTargetDate)
        goalNeedsWholeAmount = try container.decodeIfPresent(
            Bool.self,
            forKey: .goalNeedsWholeAmount
        )
        goalFrequency = try container.decodeIfPresent(
            CategoryGoalFrequency.self,
            forKey: .goalFrequency
        )

        if container.contains(.goalTarget) {
            if try container.decodeNil(forKey: .goalTarget) {
                goalTargetUpdate = .remove
            } else {
                goalTargetUpdate = try .set(container.decode(Int64.self, forKey: .goalTarget))
            }
        } else {
            goalTargetUpdate = .unchanged
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(note, forKey: .note)
        try container.encodeIfPresent(categoryGroupId, forKey: .categoryGroupId)
        try container.encodeIfPresent(goalTargetDate, forKey: .goalTargetDate)
        try container.encodeIfPresent(goalNeedsWholeAmount, forKey: .goalNeedsWholeAmount)
        try container.encodeIfPresent(goalFrequency, forKey: .goalFrequency)

        switch goalTargetUpdate {
        case .unchanged:
            break
        case let .set(amount):
            try container.encode(amount, forKey: .goalTarget)
        case .remove:
            try container.encodeNil(forKey: .goalTarget)
        }
    }
}
