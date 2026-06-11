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
    public func plans(includeAccounts: Bool) async throws -> [PlanSummary] {
        let request = PlanSummaryRequest(includeAccounts: includeAccounts)
        let response = try await client.perform(request)
        return response.plans
    }

    public func plan(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> PlanResponse {
        let request = PlanDetailRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return PlanResponse(plan: response.plan, serverKnowledge: response.serverKnowledge)
    }

    public func planSettings(planId: String) async throws -> PlanSettings {
        let request = PlanSettingsRequest(planId: planId)
        let response = try await client.perform(request)
        return response.settings
    }
}
