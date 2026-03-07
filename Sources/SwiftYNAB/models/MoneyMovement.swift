//
//  MoneyMovement.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// Represents a money movement between categories
public struct MoneyMovement: Codable, Equatable, Sendable {
    /// Money movement id in UUID format
    public let id: String

    /// The month of the money movement in ISO format (e.g. 2024-01-01)
    public let month: String?

    /// The date/time the money movement was processed on the server in ISO format
    public let movedAt: String?

    /// Optional note for the money movement
    public let note: String?

    /// The id of the money movement group this movement belongs to
    public let moneyMovementGroupId: String?

    /// The id of the user who performed the money movement
    public let performedByUserId: String?

    /// The id of the category the money was moved from
    public let fromCategoryId: String?

    /// The id of the category the money was moved to
    public let toCategoryId: String?

    /// The amount of the money movement in milliunits format
    public let amount: Int
}
