//
//  MoneyMovementService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to money movement operations
public struct MoneyMovementService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension MoneyMovementService: MoneyMovementServiceType {
    /// Returns all money movements for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: A list of money movements and the server knowledge
    public func moneyMovements(
        planId: String
    ) async throws -> ([MoneyMovement], ServerKnowledge) {
        let request = MoneyMovementsRequest(planId: planId)
        let response = try await client.perform(request)
        return (response.moneyMovements, response.serverKnowledge)
    }

    /// Returns money movements for a specific plan month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) ("current" can also be used to
    /// specify the current calendar month (UTC))
    ///
    /// - Returns: A list of money movements and the server knowledge
    public func moneyMovements(
        planId: String,
        month: String
    ) async throws -> ([MoneyMovement], ServerKnowledge) {
        let request = MoneyMovementsByMonthRequest(planId: planId, month: month)
        let response = try await client.perform(request)
        return (response.moneyMovements, response.serverKnowledge)
    }

    /// Returns all money movement groups for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: A list of money movement groups and the server knowledge
    public func moneyMovementGroups(
        planId: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge) {
        let request = MoneyMovementGroupsRequest(planId: planId)
        let response = try await client.perform(request)
        return (response.moneyMovementGroups, response.serverKnowledge)
    }

    /// Returns money movement groups for a specific plan month.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - month: The plan month in ISO format (e.g. 2016-12-01) ("current" can also be used to
    /// specify the current calendar month (UTC))
    ///
    /// - Returns: A list of money movement groups and the server knowledge
    public func moneyMovementGroups(
        planId: String,
        month: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge) {
        let request = MoneyMovementGroupsByMonthRequest(planId: planId, month: month)
        let response = try await client.perform(request)
        return (response.moneyMovementGroups, response.serverKnowledge)
    }
}
