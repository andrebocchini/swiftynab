//
//  BudgetService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to budget operations
public struct BudgetService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension BudgetService: BudgetServiceType {
    /// Returns budgets list with summary information.
    ///
    /// - Parameters:
    ///     - includeAccounts: Includes budget accounts in the response
    /// - Returns: A list of budgets
    public func budgets(includeAccounts: Bool) async throws -> [BudgetSummary] {
        let request = BudgetSummaryRequest(includeAccounts: includeAccounts)
        let response = try await client.perform(request)
        return response.budgets
    }

    /// Returns a single budget with all related entities.
    ///
    /// This  is effectively a full budget export.  Depending on the size of your budget, this
    /// request can take a while.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A single budget and the last knowledge of the server
    public func budget(
        budgetId: String,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> (BudgetDetail, ServerKnowledge) {
        let request = BudgetDetailRequest(
            budgetId: budgetId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.budget, response.lastKnowledgeOfServer)
    }

    /// Returns settings for a budget.
    ///
    /// - Parameters:
    ///    - budgetId: The id of the budget (*last_used* can also be used to specify the last used
    /// budget)
    ///
    /// - Returns: Settings for a specific budget
    public func budgetSettings(budgetId: String) async throws -> BudgetSettings {
        let request = BudgetSettingsRequest(budgetId: budgetId)
        let response = try await client.perform(request)
        return response.settings
    }
}
