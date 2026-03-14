//
//  PlanServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol PlanServiceType: Sendable {
    func plans(includeAccounts: Bool) async throws -> [PlanSummary]

    func plan(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> (PlanDetail, ServerKnowledge)

    func planSettings(planId: String) async throws -> PlanSettings
}
