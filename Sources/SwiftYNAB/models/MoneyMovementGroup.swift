//
//  MoneyMovementGroup.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// Represents a group of money movements
public struct MoneyMovementGroup: Codable, Equatable, Sendable {
    /// Money movement group id in UUID format
    public let id: String

    /// When the money movement group was created
    public let groupCreatedAt: String

    /// The month of the money movement group in ISO format (e.g. 2024-01-01)
    public let month: String

    /// Optional note
    public let note: String?

    /// The id of the user who performed the money movement group
    public let performedByUserId: String?
}
