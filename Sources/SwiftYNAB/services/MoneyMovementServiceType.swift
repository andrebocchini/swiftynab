//
//  MoneyMovementServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to money movement operations
public protocol MoneyMovementServiceType: Sendable {
    /// Returns all money movements for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: A list of money movements and the knowledge of the server
    func moneyMovements(planId: String) async throws -> MoneyMovementsResponse

    /// Returns money movements for a specific plan month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) ("current" can also be used to
    /// specify the current calendar month (UTC))
    ///
    /// - Returns: A list of money movements and the knowledge of the server
    func moneyMovements(planId: String, month: String) async throws -> MoneyMovementsResponse

    /// Returns all money movement groups for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: A list of money movement groups and the knowledge of the server
    func moneyMovementGroups(planId: String) async throws -> MoneyMovementGroupsResponse

    /// Returns money movement groups for a specific plan month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) ("current" can also be used to
    /// specify the current calendar month (UTC))
    ///
    /// - Returns: A list of money movement groups and the knowledge of the server
    func moneyMovementGroups(
        planId: String,
        month: String
    ) async throws -> MoneyMovementGroupsResponse
}
