//
//  PayeeService.swift
//  SwiftYNAB
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import Foundation

/// Provides access to payee operations
public struct PayeeService {
    private let client: ClientType

    init(client: ClientType) {
        self.client = client
    }
}

extension PayeeService: PayeeServiceType {
    public func createPayee(planId: String, payee: SavePayee) async throws -> PayeeResponse {
        let request = CreatePayeeRequest(planId: planId, payee: payee)
        let response = try await client.perform(request)
        return PayeeResponse(payee: response.payee, serverKnowledge: response.serverKnowledge)
    }

    public func payees(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge?
    ) async throws -> PayeesResponse {
        let request = PayeesRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return PayeesResponse(payees: response.payees, serverKnowledge: response.serverKnowledge)
    }

    public func payee(planId: String, payeeId: String) async throws -> Payee {
        let request = PayeeRequest(planId: planId, payeeId: payeeId)
        let response = try await client.perform(request)
        return response.payee
    }

    public func updatePayee(
        planId: String,
        payeeId: String,
        payee: SavePayee
    ) async throws -> PayeeResponse {
        let request = UpdatePayeeRequest(
            planId: planId,
            payeeId: payeeId,
            payee: payee
        )
        let response = try await client.perform(request)
        return PayeeResponse(payee: response.payee, serverKnowledge: response.serverKnowledge)
    }
}
