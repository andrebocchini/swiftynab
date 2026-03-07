//
//  MoneyMovementServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

protocol MoneyMovementServiceType: Sendable {
    func moneyMovements(
        budgetId: String
    ) async throws -> ([MoneyMovement], ServerKnowledge)

    func moneyMovements(
        budgetId: String,
        month: String
    ) async throws -> ([MoneyMovement], ServerKnowledge)

    func moneyMovementGroups(
        budgetId: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge)

    func moneyMovementGroups(
        budgetId: String,
        month: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge)
}
