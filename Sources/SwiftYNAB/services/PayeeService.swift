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
    /// Creates a single payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payee: The payee to create
    ///
    /// - Returns: A single payee and the last server knowledge
    public func createPayee(
        planId: String,
        payee: SavePayee
    ) async throws -> (Payee, ServerKnowledge) {
        let request = CreatePayeeRequest(planId: planId, payee: payee)
        let response = try await client.perform(request)
        return (response.payee, response.serverKnowledge)
    }

    /// Returns all payees
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A list of payees
    public func payees(
        planId: String,
        lastKnowledgeOfServer: ServerKnowledge? = nil
    ) async throws -> [Payee] {
        let request = PayeesRequest(
            planId: planId,
            lastKnowledgeOfServer: lastKnowledgeOfServer
        )
        let response = try await client.perform(request)
        return response.payees
    }

    /// Returns a single payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - lastKnowledgeOfServer: If provided, only entities that have changed since
    /// `lastKnowledgeOfServer`
    ///    will be included.
    ///
    /// - Returns: A single payee
    public func payee(planId: String, payeeId: String) async throws -> Payee {
        let request = PayeeRequest(planId: planId, payeeId: payeeId)
        let response = try await client.perform(request)
        return response.payee
    }

    /// Updates a single payee.
    ///
    /// - Parameters:
    ///    - planId: The id of the plan (*last_used* can also be used to specify the last used
    /// plan)
    ///    - payeeId: The id of the payee being update
    ///    - payee: The details of the payee that need to be updated
    ///
    /// - Returns: A single payee and the last server knowledge
    public func updatePayee(
        planId: String,
        payeeId: String,
        payee: SavePayee
    ) async throws -> (Payee, ServerKnowledge) {
        let request = UpdatePayeeRequest(
            planId: planId,
            payeeId: payeeId,
            payee: payee
        )
        let response = try await client.perform(request)
        return (response.payee, response.serverKnowledge)
    }
}
