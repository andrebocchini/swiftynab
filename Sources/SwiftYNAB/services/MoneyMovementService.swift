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
    /// Returns all money movements for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///
    /// - Returns: A list of money movements and the server knowledge
    public func moneyMovements(
        budgetId: String
    ) async throws -> ([MoneyMovement], ServerKnowledge) {
        let request = MoneyMovementsRequest(budgetId: budgetId)
        let response = try await client.perform(request)
        return (response.moneyMovements, response.serverKnowledge)
    }

    /// Returns money movements for a specific budget month.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - month: The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to
    /// specify the current calendar month (UTC))
    ///
    /// - Returns: A list of money movements and the server knowledge
    public func moneyMovements(
        budgetId: String,
        month: String
    ) async throws -> ([MoneyMovement], ServerKnowledge) {
        let request = MoneyMovementsByMonthRequest(budgetId: budgetId, month: month)
        let response = try await client.perform(request)
        return (response.moneyMovements, response.serverKnowledge)
    }

    /// Returns all money movement groups for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///
    /// - Returns: A list of money movement groups and the server knowledge
    public func moneyMovementGroups(
        budgetId: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge) {
        let request = MoneyMovementGroupsRequest(budgetId: budgetId)
        let response = try await client.perform(request)
        return (response.moneyMovementGroups, response.serverKnowledge)
    }

    /// Returns money movement groups for a specific budget month.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - month: The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to
    /// specify the current calendar month (UTC))
    ///
    /// - Returns: A list of money movement groups and the server knowledge
    public func moneyMovementGroups(
        budgetId: String,
        month: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge) {
        let request = MoneyMovementGroupsByMonthRequest(budgetId: budgetId, month: month)
        let response = try await client.perform(request)
        return (response.moneyMovementGroups, response.serverKnowledge)
    }
}
