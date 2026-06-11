//
//  MonthService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to month operations
public struct MonthService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension MonthService: MonthServiceType {
    public func months(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> MonthsResponse {
        let request = MonthsRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return MonthsResponse(months: response.months, serverKnowledge: response.serverKnowledge)
    }

    public func month(planId: String, month: String) async throws -> MonthDetail {
        let request = MonthRequest(planId: planId, month: month)
        let response = try await client.perform(request)
        return response.month
    }
}
