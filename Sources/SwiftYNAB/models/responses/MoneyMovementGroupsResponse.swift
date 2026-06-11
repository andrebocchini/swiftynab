//
//  MoneyMovementGroupsResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching the money movement groups in a plan
public struct MoneyMovementGroupsResponse: Equatable, Sendable {
    /// The requested money movement groups
    public let moneyMovementGroups: [MoneyMovementGroup]

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(moneyMovementGroups: [MoneyMovementGroup], serverKnowledge: ServerKnowledge) {
        self.moneyMovementGroups = moneyMovementGroups
        self.serverKnowledge = serverKnowledge
    }
}
