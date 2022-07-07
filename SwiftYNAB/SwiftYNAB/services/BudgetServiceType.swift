//
//  BudgetServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol BudgetServiceType {
    func getBudgets() async throws -> [BudgetSummary]

    func getBudget(budgetId: String, lastKnowledgeOfServer: Int?) async throws -> BudgetDetail

    func getBudgetSettings(budgetId: String) async throws -> BudgetSettings
}
