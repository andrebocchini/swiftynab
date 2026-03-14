//
//  BudgetServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol BudgetServiceType: Sendable {
    func budgets(includeAccounts: Bool) async throws -> [PlanSummary]

    func budget(
        budgetId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> (PlanDetail, ServerKnowledge)

    func budgetSettings(budgetId: String) async throws -> PlanSettings
}
