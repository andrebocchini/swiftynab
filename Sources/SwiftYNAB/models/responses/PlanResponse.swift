//
//  PlanResponse.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 6/11/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

/// Response returned when fetching a single plan
public struct PlanResponse: Equatable, Sendable {
    /// The requested plan
    public let plan: PlanDetail

    /// The knowledge of the server
    public let serverKnowledge: ServerKnowledge

    public init(plan: PlanDetail, serverKnowledge: ServerKnowledge) {
        self.plan = plan
        self.serverKnowledge = serverKnowledge
    }
}
