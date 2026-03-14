//
//  MonthServiceType.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 7/7/22.
//  Copyright © 2022 Andre Bocchini. All rights reserved.
//

import Foundation

protocol MonthServiceType: Sendable {
    func months(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> ([MonthSummary], ServerKnowledge)

    func month(planId: String, month: String) async throws -> MonthDetail
}
