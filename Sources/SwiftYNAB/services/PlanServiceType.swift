//
//  PlanServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to plan operations
public protocol PlanServiceType: Sendable {
    /// Returns plans list with summary information.
    ///
    /// - Parameters:
    ///     - includeAccounts: Includes plan accounts in the response
    ///
    /// - Returns: A list of plans
    func plans(includeAccounts: Bool) async throws -> [PlanSummary]

    /// Returns a single plan with all related entities.
    ///
    /// This is effectively a full plan export. Depending on the size of your plan, this request
    /// can take a while.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - lastKnowledgeOfServer: The starting server knowledge. If provided, only entities that
    ///    have changed since `lastKnowledgeOfServer` will be included.
    ///
    /// - Returns: A single plan and the knowledge of the server
    func plan(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> PlanResponse

    /// Returns settings for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: Settings for a specific plan
    func planSettings(planId: String) async throws -> PlanSettings
}

public extension PlanServiceType {
    /// Returns a single plan with all related entities, with optional parameters defaulted.
    func plan(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> PlanResponse {
        try await plan(planId: planId, lastKnowledgeOfServer: lastKnowledgeOfServer)
    }
}
