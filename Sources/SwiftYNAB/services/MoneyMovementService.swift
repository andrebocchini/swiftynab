//
//  MoneyMovementService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 3/5/26.
//  Copyright © 2026 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to money movement operations
public struct MoneyMovementService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension MoneyMovementService: MoneyMovementServiceType {
    public func moneyMovements(planId: String) async throws -> MoneyMovementsResponse {
        let request = MoneyMovementsRequest(planId: planId)
        let response = try await client.perform(request)
        return MoneyMovementsResponse(
            moneyMovements: response.moneyMovements,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func moneyMovements(
        planId: String,
        month: String
    ) async throws -> MoneyMovementsResponse {
        let request = MoneyMovementsByMonthRequest(planId: planId, month: month)
        let response = try await client.perform(request)
        return MoneyMovementsResponse(
            moneyMovements: response.moneyMovements,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func moneyMovementGroups(planId: String) async throws -> MoneyMovementGroupsResponse {
        let request = MoneyMovementGroupsRequest(planId: planId)
        let response = try await client.perform(request)
        return MoneyMovementGroupsResponse(
            moneyMovementGroups: response.moneyMovementGroups,
            serverKnowledge: response.serverKnowledge
        )
    }

    public func moneyMovementGroups(
        planId: String,
        month: String
    ) async throws -> MoneyMovementGroupsResponse {
        let request = MoneyMovementGroupsByMonthRequest(planId: planId, month: month)
        let response = try await client.perform(request)
        return MoneyMovementGroupsResponse(
            moneyMovementGroups: response.moneyMovementGroups,
            serverKnowledge: response.serverKnowledge
        )
    }
}
