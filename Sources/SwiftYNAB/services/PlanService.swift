//
//  PlanService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to plan operations
public struct PlanService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension PlanService: PlanServiceType {
    /// Returns plans list with summary information.
    ///
    /// - Parameters:
    ///     - includeAccounts: Includes plan accounts in the response
    /// - Returns: A list of plans
    public func plans(includeAccounts: Bool) async throws -> [PlanSummary] {
        let request = PlanSummaryRequest(includeAccounts: includeAccounts)
        let response = try await client.perform(request)
        return response.plans
    }

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
    /// - Returns: A single plan and the last knowledge of the server
    public func plan(
        planId: String,
        lastKnowledgeOfServer: Int? = nil
    ) async throws -> (PlanDetail, ServerKnowledge) {
        let request = PlanDetailRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return (response.plan, response.serverKnowledge)
    }

    /// Returns settings for a plan.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///
    /// - Returns: Settings for a specific plan
    public func planSettings(planId: String) async throws -> PlanSettings {
        let request = PlanSettingsRequest(planId: planId)
        let response = try await client.perform(request)
        return response.settings
    }
}
