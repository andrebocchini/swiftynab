//
//  MoneyMovementsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the money movements in a plan
public struct MoneyMovementsResponse: Equatable, Sendable {
    /// The requested money movements
    public let moneyMovements: [MoneyMovement]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(moneyMovements: [MoneyMovement], serverKnowledge: ServerKnowledge) {
        self.moneyMovements = moneyMovements
        self.serverKnowledge = serverKnowledge
    }
}
