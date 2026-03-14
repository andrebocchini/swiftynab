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
        planId: String
    ) async throws -> ([MoneyMovement], ServerKnowledge)

    func moneyMovements(
        planId: String,
        month: String
    ) async throws -> ([MoneyMovement], ServerKnowledge)

    func moneyMovementGroups(
        planId: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge)

    func moneyMovementGroups(
        planId: String,
        month: String
    ) async throws -> ([MoneyMovementGroup], ServerKnowledge)
}
